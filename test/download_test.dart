import 'package:application/features/explore/presentation/bloc/search/search_event.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("query tekshiruv", () async {
    final query = SearchAnime.fromSearch("c:amedia-content");
    print(query.query.category);
    print(query.query.genre);
    print(query.query.search);
    expect(query.search, "");
  });
}
