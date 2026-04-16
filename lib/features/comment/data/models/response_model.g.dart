// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseModel _$CommentResponseModelFromJson(
  Map<String, dynamic> json,
) => CommentResponseModel(
  comments: (json['comments'] as List<dynamic>?)
      ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : CommentPaginationModel.fromJson(
          json['pagination'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CommentResponseModelToJson(
  CommentResponseModel instance,
) => <String, dynamic>{
  'comments': instance.comments,
  'pagination': instance.pagination,
};

CommentPaginationModel _$CommentPaginationModelFromJson(
  Map<String, dynamic> json,
) => CommentPaginationModel(
  limit: (json['limit'] as num?)?.toInt() ?? 10,
  total: (json['total'] as num?)?.toInt() ?? 0,
  pages: (json['pages'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 1,
  next: (json['next'] as num?)?.toInt() ?? 2,
);

Map<String, dynamic> _$CommentPaginationModelToJson(
  CommentPaginationModel instance,
) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'pages': instance.pages,
  'total': instance.total,
  'next': instance.next,
};
