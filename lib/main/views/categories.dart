import 'package:application/constants/colors.dart';
import 'package:application/models/category.dart';
import 'package:application/services/categories.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  List<Category>? _categories;
  List<Genre>? _genres;
  bool _loading = true;

  Future<void> fetchData() async {
    List<Category> categories = await FetchCategories().get();
    List<Genre> genres = await FetchGenres().get();
    setState(() {
      _loading = false;
      _categories = categories;
      _genres = genres;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RefreshIndicator.adaptive(
        onRefresh: () => fetchData(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            frame(
              'Kategoriyalar',
              Builder(
                builder: (context) {
                  if (_loading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  if (_categories != null) {
                    List<Category> categories = _categories as List<Category>;
                    return GridView.extent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 10 / 7,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: categories
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
                    );
                  }
                  return Text("${_categories.toString()} Something happened");
                },
              ),
            ),
            frame(
              'Janrlar',
              Builder(
                builder: (context) {
                  if (_loading) {
                    return Center(child: CircularProgressIndicator.adaptive());
                  }
                  if (_genres != null) {
                    List<Genre> genres = _genres as List<Genre>;
                    return GridView.extent(
                      physics: const NeverScrollableScrollPhysics(),
                      maxCrossAxisExtent: 150,
                      shrinkWrap: true,
                      childAspectRatio: 10 / 6,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      children: genres
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
                    );
                  }
                  return Text("${_categories.toString()} Something happened");
                },
              ),
            ),
          ],
        ),
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
