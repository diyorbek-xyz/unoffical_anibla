import 'package:material_ui/material_ui.dart';

class CenterZoomViewer extends StatefulWidget {
  final Widget child;
  const CenterZoomViewer({super.key, required this.child});

  @override
  State<CenterZoomViewer> createState() => _CenterZoomViewerState();
}

class _CenterZoomViewerState extends State<CenterZoomViewer> {
  final TransformationController _transformationController = TransformationController();
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: GestureDetector(
        behavior: .opaque,
        onScaleStart: (details) {
          setState(() => (_baseScale = _currentScale));
          print("object");
        },
        onScaleUpdate: (details) => setState(() {
          _currentScale = (_baseScale * details.scale).clamp(1.0, 4.0);
          _transformationController.value = Matrix4.skew(_currentScale, _currentScale);
          print("object");
        }),
        child: InteractiveViewer(
          transformationController: _transformationController,
          scaleEnabled: false,
          panEnabled: false,
          child: widget.child,
        ),
      ),
    ),
  );

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }
}
