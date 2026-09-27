import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_request.freezed.dart';

@freezed
abstract class GetCommentRequest with _$GetCommentRequest {
  const GetCommentRequest._();
  const factory GetCommentRequest({required String id, required int limit, required int page, required String type}) =
      _GetCommentRequest;

  Map<String, dynamic> get query => {"limit": limit, "page": page};
}

@freezed
abstract class GetComRepliesRequest with _$GetComRepliesRequest {
  const factory GetComRepliesRequest({@Default(0) int limit, @Default(0) int page, @Default("") String id}) =
      _GetComRepliesRequest;
}
