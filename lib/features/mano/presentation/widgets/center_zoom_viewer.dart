import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CenterZoomViewer extends StatefulWidget {
  const CenterZoomViewer({super.key, required this.child});

  final Widget child;

  @override
  State<CenterZoomViewer> createState() => _CenterZoomViewerState();
}

class _CenterZoomViewerState extends State<CenterZoomViewer> {
  static const _minScale = 1.0;
  static const _maxScale = 4.0;

  double _scale = 1.0;
  double _startScale = 1.0;
  bool _ctrlHeld = false;

  @override
  void initState() {
    super.initState();
    HardwareKeyboard.instance.addHandler(_onKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onKey);
    super.dispose();
  }

  bool _onKey(KeyEvent _) {
    final held = HardwareKeyboard.instance.isControlPressed;
    if (held != _ctrlHeld) setState(() => _ctrlHeld = held);
    return false;
  }

  void _zoomTo(double value) => setState(() => _scale = value.clamp(_minScale, _maxScale));

  void _onSignal(PointerSignalEvent e) {
    if (e is! PointerScrollEvent || !_ctrlHeld) return;
    GestureBinding.instance.pointerSignalResolver.register(e, (event) {
      final dy = (event as PointerScrollEvent).scrollDelta.dy;
      _zoomTo(_scale * (dy > 0 ? 0.9 : 1.1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: _onSignal,
      child: GestureDetector(
        onScaleStart: (_) => _startScale = _scale,
        onScaleUpdate: (d) {
          if (d.pointerCount >= 2) _zoomTo(_startScale * d.scale);
        },
        child: ClipRect(
          child: Transform.scale(
            scale: _scale,
            alignment: Alignment.center,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
