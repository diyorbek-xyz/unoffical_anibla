import 'package:application/features/comment/data/mapper/comment_mapper.dart';
import 'package:application/features/comment/data/models/response_model.dart';
import 'package:application/features/comment/domain/entities/response_entity.dart';

class CommentResponseMapper {
  static CommentResponse responseToEntity(CommentResponseModel? model) =>
      CommentResponse(
        comments:
            model?.comments?.map(CommentMapper.modelToEntity).toList() ?? [],
        pagination: paginationToEntity(model?.pagination),
      );
  static CommentPagination paginationToEntity(CommentPaginationModel? model) =>
      CommentPagination(
        limit: model?.limit ?? 10,
        total: model?.total ?? 0,
        pages: model?.pages ?? 0,
        page: model?.page ?? 1,
        next: model?.next ?? 0,
      );
}
