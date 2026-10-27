import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/network/resources/failure.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/shared/widgets/error.dart';
import 'package:flutter/material.dart';
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
  }) => SignalBuilder(
    builder: (context) {
      final state = futureSignal.value;
      if (state.hasError) return ErrorBuilder(message: (state.error as Failure).message, refresh: () {});
      final data = state.value ?? fake;
      return Skeletonizer(
        enabled: state.isLoading,
        child: Recommends(title: title, items: data.map((e) => builder(context, e)).toList()),
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
            padding: .symmetric(horizontal: context.isMobile ? 10 : 0),
            clipBehavior: .none,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Row(spacing: 10, children: widget.items),
          ),
        ],
      ),
    );
  }
}
