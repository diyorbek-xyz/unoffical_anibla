import 'package:application/constants/colors.dart';
import 'package:application/data/models/filter.dart';
import 'package:application/data/repositories/categories_repo.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final _repo = FilterRepository();

  List<Category>? _categories;
  List<Genre>? _genres;
  bool _loading = true;
  String? _error;

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final categories = await _repo.getCategories();
      final genres = await _repo.getGenres();
      if (!mounted) return;
      setState(() {
        _loading = false;
        _categories = categories;
        _genres = genres;
      });
    } catch (e) {
      setState(() {
        _loading = false;
        _error = e.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _load(),
      child: Builder(
        builder: (context) {
          if (_loading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          if (_error != null) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(_error!),
                  ElevatedButton.icon(onPressed: () => _load(), icon: Icon(Icons.replay_outlined), label: Text("Yanglilash")),
                ],
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                frame(
                  'Kategoriyalar',
                  GridView.extent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 10 / 7,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _categories!
                        .map(
                          (category) => InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: primaryTint,
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary),
                              child: Text(category.title.uz, style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                frame(
                  'Janrlar',
                  GridView.extent(
                    physics: const NeverScrollableScrollPhysics(),
                    maxCrossAxisExtent: 150,
                    shrinkWrap: true,
                    childAspectRatio: 10 / 6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 15,
                    children: _genres!
                        .map(
                          (category) => InkWell(
                            borderRadius: BorderRadius.circular(10),
                            splashColor: primaryTint,
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: primary),
                              padding: EdgeInsets.all(10),
                              child: Text(category.title.uz, style: TextStyle(fontSize: 20)),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Padding frame(String title, Widget child) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          child,
        ],
      ),
    );
  }
}
