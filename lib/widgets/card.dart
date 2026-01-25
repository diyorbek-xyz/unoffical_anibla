import 'package:flutter/material.dart';

class WidgetCard extends StatelessWidget {
  final String image;
  final String title;
  final int count;
  final price;

  const WidgetCard({super.key, required this.image, required this.title, required this.price, required this.count});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Image.network(image, height: 200, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(price.toString() + ' so\'m', style: TextStyle(fontSize: 15)),
                Text(title, style: TextStyle(fontSize: 15)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
