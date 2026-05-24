import 'package:freezed_annotation/freezed_annotation.dart';

part 'props.freezed.dart';

@freezed
sealed class GetCommentsProps with _$GetCommentsProps {
  GetCommentsProps._();

  factory GetCommentsProps({required String id, required int limit, required int page, required String type}) = _GetCommentsProps;

  Map<String, dynamic> get query => {"limit": limit, "page": page};
}

class GetRepliesProps {
  final int limit;
  final int page;
  final String id;
  const GetRepliesProps({required this.id, required this.limit, required this.page});
}
