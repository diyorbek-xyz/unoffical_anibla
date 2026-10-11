import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/features/anibla/presentation/controllers/comment_controller.dart';
import 'package:application/injection_container.dart';
import 'package:application/shared/constants/icons.dart';
import 'package:application/shared/utils/extensions.dart';
import 'package:application/features/anibla/data/models/data/comment.dart';
import 'package:application/shared/image_provider/fallback_provider.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class CommentsMenu extends StatefulWidget {
  const CommentsMenu({super.key});

  @override
  State<CommentsMenu> createState() => _CommentsMenuState();
}

class _CommentsMenuState extends State<CommentsMenu> {
  late final CommentController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = sl<CommentController>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1000),
        child: CustomScrollView(
          scrollBehavior: ScrollBehavior().copyWith(scrollbars: false),
          key: const PageStorageKey("comments"),
          slivers: [
            SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(bottom: 80),
              sliver: SignalBuilder(
                builder: (context) {
                  final state = _commentController.animeCommentsState;
                  final comments = state.data ?? [];
                  return SliverInfiniteList(
                    onFetchData: _commentController.getAnimeComments,
                    hasError: state.hasError,
                    isLoading: state.isLoading,
                    hasReachedMax: !state.value.pagination.hasMore,
                    itemCount: comments.length,
                    loadingBuilder: (context) => Skeletonizer(
                      enabled: true,
                      child: Column(children: _commentController.fakeComments.map(commentTile).toList()),
                    ),
                    itemBuilder: (context, index) => desktopCommentItem(comments[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget desktopCommentItem(Comment comment) {
    return SignalBuilder(
      builder: (context) {
        final state = _commentController.animeRepliesState;
        final replies = state.getEntry(comment.id);
        if (replies == null || !replies.hasValue) return commentTile(comment);
        return Column(
          children: [
            commentTile(comment),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 50),
              child: Column(children: replies.value.map(commentTile).toList()),
            ),
          ],
        );
      },
    );
  }

  Positioned repliesLine() => Positioned(
    left: 45,
    top: 50,
    bottom: 70,
    child: Container(
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: .circular(20)),
        border: Border(
          left: BorderSide(width: 1, color: context.appColors.primary),
          bottom: BorderSide(width: 1, color: context.appColors.primary),
        ),
      ),
    ),
  );

  Widget commentTile(Comment comment) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return SelectionArea(
      child: ListTile(
        minTileHeight: 100,
        leading: CircleAvatar(
          radius: isMobile ? 20 : 30,
          backgroundImage: imageProviderFallback(comment.user.avatar),
          onBackgroundImageError: (exception, stackTrace) => exception.toString(),
        ),
        title: Row(
          spacing: 10,
          children: [
            Text(comment.user.name, style: TextStyle(color: context.appColors.primary)),
            Text(
              DateTime.tryParse(comment.createdAt)?.formatRemaining() ?? "",
              style: TextStyle(color: context.appColors.onSurface.withAlpha(100)),
            ),
          ],
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            MouseRegion(cursor: SystemMouseCursors.text, child: Text(comment.message)),
            commentActions(comment),
          ],
        ),
      ),
    );
  }

  Wrap commentActions(Comment comment) => Wrap(
    spacing: 5,
    children: [
      InkWell(
        onTap: () {},
        mouseCursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
          child: Row(
            mainAxisSize: .min,
            spacing: 5,
            children: [
              Icon(MyIcons.like, size: 18),
              Text(NumberFormat.compact(locale: "uz").format(comment.likesCount), style: context.textTheme.labelLarge),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {},
        mouseCursor: SystemMouseCursors.click,
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2), child: Icon(Icons.reply, size: 18)),
      ),
      if (comment.repliesCount != 0)
        SignalBuilder(
          builder: (context) {
            final state = _commentController.animeRepliesState;
            final entry = state.getEntry(comment.id);
            if (entry == null || !entry.hasValue) return SizedBox.shrink();
            return InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () => _commentController.getAnimeReplies(comment.id),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2),
                child: Row(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .center,
                  mainAxisSize: .min,
                  children: [
                    Text("${comment.repliesCount}ta javoblarni ochish", style: TextStyle(color: context.appColors.primary)),
                    Icon(Icons.keyboard_arrow_down, color: context.appColors.primary, size: 18),
                  ],
                ),
              ),
            );
          },
        ),
    ],
  );
}
