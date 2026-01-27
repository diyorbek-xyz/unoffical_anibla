import 'package:application/constants/icons.dart';
import 'package:application/models/anime.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetComment extends StatelessWidget {
  final Comment comment;
  const WidgetComment({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final compact = NumberFormat.compact(locale: "uz");
    final ButtonStyle buttonStyle = ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 7, vertical: -3)));
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        CircleAvatar(minRadius: 20, maxRadius: 30, backgroundImage: CachedNetworkImageProvider(comment.user.avatar)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(comment.user.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              Text(comment.message),
              Row(
                spacing: 5,
                children: [
                  TextButton.icon(
                    style: buttonStyle,
                    onPressed: () {},
                    icon: Icon(MyIcons.like),
                    label: Text(compact.format(comment.likes)),
                  ),
                  TextButton.icon(
                    style: buttonStyle,
                    onPressed: () {},
                    label: Icon(MyIcons.dislike),
                  ),
                  TextButton.icon(style: buttonStyle, onPressed: () {}, label: Icon(Icons.reply)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetComments extends StatelessWidget {
  final List<Comment>? comments;
  const WidgetComments({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            spacing: 10,
            crossAxisAlignment: .start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                child: Image.asset('assets/images/avatar.png', height: 60),
              ),
              Expanded(child: TextField(maxLength: 100, minLines: 1, maxLines: 3)),
              IconButton(onPressed: () {}, icon: Icon(Icons.message)),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            if (comments == null) return Center(child: Text("NO COMMENT"));
            final allComments = comments as List<Comment>;
            return Column(spacing: 10, children: allComments.map((comment) => WidgetComment(comment: comment)).toList());
          },
        ),
      ],
    );
  }
}
