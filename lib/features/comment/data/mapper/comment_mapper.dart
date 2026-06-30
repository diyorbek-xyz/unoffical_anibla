import 'package:application/features/comment/data/models/comment_model.dart';
import 'package:application/features/comment/domain/entities/comment_entity.dart';
import 'package:application/features/profile/data/mapper/profile_mapper.dart';

class CommentMapper {
  static CommentEntity modelToEntity(CommentModel model) => CommentEntity(
    id: model.id ?? "",
    isActive: model.isActive ?? false,
    isCurrentUser: model.isCurrentUser ?? 0,
    likesCount: model.likesCount ?? 0,
    message: model.message ?? "",
    repliedId: "",
    repliesCount: model.repliesCount ?? 0,
    user: ProfileMapper.modelToEntity(
      (model.user != null &&
              model.user!.image != null &&
              model.user!.name != null &&
              model.user!.name!.isNotEmpty &&
              model.user!.image != null &&
              model.user!.image!.isNotEmpty)
          ? model.user
          : model.userId,
    ),
    createdAt: model.createdAt ?? DateTime(2026),
  );
}
