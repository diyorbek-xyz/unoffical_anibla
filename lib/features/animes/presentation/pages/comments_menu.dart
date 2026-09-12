import 'package:application/core/config/theme/app_colors.dart';
import 'package:application/core/config/theme/app_theme.dart';
import 'package:application/core/constants/icons.dart';
import 'package:application/core/utils/extensions.dart';
import 'package:application/features/comment/data/mapper/comment_mapper.dart';
import 'package:application/features/comment/data/models/comment_model.dart';
import 'package:application/features/comment/domain/entities/comment_entity.dart';
import 'package:application/features/comment/domain/entities/response_entity.dart';
import 'package:application/features/comment/presentation/bloc/comment_bloc.dart';
import 'package:application/features/comment/presentation/bloc/comment_event.dart';
import 'package:application/features/comment/presentation/bloc/comment_state.dart';
import 'package:application/features/common/presentation/image_provider/fallback_provider.dart';
import 'package:application/features/profile/data/models/profile/profile_model.dart';
import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:very_good_infinite_list/very_good_infinite_list.dart';

class CommentsMenu extends StatefulWidget {
  const CommentsMenu({super.key});

  @override
  State<CommentsMenu> createState() => _CommentsMenuState();
}

class _CommentsMenuState extends State<CommentsMenu> {
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
              sliver: BlocBuilder<CommentBloc, CommentState>(
                builder: (context, state) {
                  final fakeData = CommentMapper.modelToEntity(
                    CommentModel(
                      user: ProfileModel(name: "User Loading..."),
                      message: "Message loading...",
                    ),
                  );
                  final fake = List.generate(5, (i) => fakeData);
                  final comments = state.response?.comments ?? [];
                  return SliverInfiniteList(
                    onFetchData: () => context.read<CommentBloc>().add(GetComments()),
                    isLoading: state.state == .loading,
                    hasReachedMax: state.state == .endReached,
                    itemCount: comments.length,
                    loadingBuilder: (context) => Skeletonizer(enabled: true, child: Column(children: fake.map(commentTile).toList())),
                    itemBuilder: (context, index) => desktopCommentItem(comments.elementAt(index)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget desktopCommentItem(CommentEntity comment) {
    return BlocSelector<CommentBloc, CommentState, CommentResponse?>(
      selector: (state) => state.replies?[comment.id],
      builder: (context, replies) {
        if (replies == null || replies.comments.isEmpty) return commentTile(comment);
        return Column(
          children: [
            commentTile(comment),
            Padding(
              padding: EdgeInsetsGeometry.only(left: 50),
              child: Column(children: replies.comments.map(commentTile).toList()),
            ),
          ],
        );
      },
    );
  }

  Positioned repliesLine() {
    return Positioned(
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
  }

  Widget commentTile(CommentEntity comment) {
    final isMobile = MediaQuery.of(context).size.width < MOBILE_WIDTH;
    return SelectionArea(
      child: ListTile(
        minTileHeight: 100,
        leading: CircleAvatar(
          radius: isMobile ? 20 : 30,
          backgroundImage: imageProviderFallback(comment.user.image),
          onBackgroundImageError: (exception, stackTrace) => exception.toString(),
        ),
        title: Row(
          spacing: 10,
          children: [
            Text(comment.user.name, style: TextStyle(color: context.appColors.primary)),
            Text(comment.createdAt.formatRemaining(), style: TextStyle(color: context.appColors.onSurface.withAlpha(100))),
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

  Wrap commentActions(CommentEntity comment) {
    return Wrap(
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
          BlocSelector<CommentBloc, CommentState, bool>(
            selector: (state) => state.replies?.containsKey(comment.id) ?? false,
            builder: (context, state) {
              if (state) return SizedBox.shrink();
              return InkWell(
                mouseCursor: SystemMouseCursors.click,
                onTap: () => context.read<CommentBloc>().add(GetReplies(comment.id)),
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
}
