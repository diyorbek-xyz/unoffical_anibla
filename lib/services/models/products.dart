class Products {
  final String title;
  final String poster;
  final int price;
  final bool status;
  final int count;
  final String description;
  Products({
    required this.title,
    required this.poster,
    required this.price,
    required this.status,
    required this.count,
    required this.description,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    String poster = (json['media'] != null && json['media'].isNotEmpty) ? json['media'][0]['image'] : '';
    return Products(
      title: json['title'] ?? 'Title',
      description: json['description'] ?? "Description",
      poster: poster,
      count: json['count'] ?? 0,
      price: json['price'] ?? 0,
      status: json['status'] ?? false,
    );
  }
}
