import 'package:flutter/widgets.dart';

class TvFocuser extends StatefulWidget {
  final Widget Function(FocusNode node) builder;
  const TvFocuser({super.key, required this.builder});

  @override
  State<TvFocuser> createState() => _TvFocuserState();
}

class _TvFocuserState extends State<TvFocuser> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 450),
            curve: Curves.easeOutCubic, // feels way more natural than easeInOut on TV
            alignment: 0.5,
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(_focusNode);
}
