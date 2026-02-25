class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> icon;

  ProductModel({
    required this.id,
    required this.title,
    required this.currentPrice,
    required this.icon,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      currentPrice: jsonData['current_price'],
      icon: List<String>.from(jsonData['photos']),
    );
  }
}
