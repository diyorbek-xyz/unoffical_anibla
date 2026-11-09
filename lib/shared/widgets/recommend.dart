import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:material_ui/material_ui.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Recommends extends StatefulWidget {
  final List<Widget> items;
  final VoidCallback? onMoreClick;
  final String title;
  final IconData icon;
  final bool hasPadding;
  const Recommends({
    super.key,
    required this.title,
    required this.items,
    this.onMoreClick,
    this.hasPadding = true,
    this.icon = Icons.local_fire_department_outlined,
  });

  @override
  State<Recommends> createState() => _RecommendsState();

  static Widget futureSignalBuilder<T>({
    required String title,
    required FutureSignal<List<T>> futureSignal,
    required Widget Function(BuildContext context, T item) builder,
    List<T> fake = const [],
    final VoidCallback? onMoreClick,
  }) => SignalBuilder(
    builder: (context) {
      final state = futureSignal.value;
      if (state.hasError) return ErrorBuilder(message: state.error.toString(), refresh: () {});
      final data = state.value ?? fake;
      return Skeletonizer(
        enabled: state.isLoading,
        child: Recommends(title: title, onMoreClick: onMoreClick, items: data.map((e) => builder(context, e)).toList()),
      );
    },
  );
  static Widget signalBuilder<T>({
    required Widget Function(BuildContext context, T item) builder,
    required List<T>? value,
    required bool isLoading,
    required bool hasError,
    required String title,
    VoidCallback? onMoreClick,
    Object? error,
    List<T> fake = const [],
  }) => Builder(
    builder: (context) {
      if (hasError) return ErrorBuilder(message: error.toString(), refresh: () {});
      final data = value ?? fake;
      return Skeletonizer(
        enabled: isLoading,
        child: Recommends(title: title, onMoreClick: onMoreClick, items: data.map((e) => builder(context, e)).toList()),
      );
    },
  );
}

class _RecommendsState extends State<Recommends> {
  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: .antiAlias,
      type: .transparency,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          ListTile(
            minVerticalPadding: 25,
            leading: Icon(widget.icon, size: context.textTheme.headlineMedium!.fontSize),
            title: Text(
              toBeginningOfSentenceCase(widget.title),
              style: context.isMobile ? context.textTheme.headlineSmall : context.textTheme.headlineMedium,
            ),
            trailing: IconButton(onPressed: widget.onMoreClick, icon: Icon(Icons.keyboard_arrow_right)),
          ),
          SingleChildScrollView(
            scrollDirection: .horizontal,
            padding: .symmetric(horizontal: 10).add(.only(bottom: 10)),
            clipBehavior: .none,
            child: Row(spacing: 10, children: widget.items),
          ),
        ],
      ),
    );
  }
}
