class GetCommentsProps {
  final int limit;
  final int page;
  final String type;
  final String id;
  const GetCommentsProps({
    required this.id,
    required this.limit,
    required this.page,
    required this.type,
  });
  Map<String, dynamic> get query => {"limit": limit, "page": page};
}

class GetRepliesProps {
  final int limit;
  final int page;
  final String id;
  const GetRepliesProps({
    required this.id,
    required this.limit,
    required this.page,
  });
}
