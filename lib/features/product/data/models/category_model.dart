class CatagoryModel {
  final String id;
  final String title;
  final String description;
  final String icon;

  CatagoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  factory CatagoryModel.fromModel(Map<String, dynamic> jsonData) {
    return CatagoryModel(
      id: jsonData['_id'] ?? 0,
      title: jsonData['title'] ?? '',
      description: jsonData['description'] ?? '',
      icon: jsonData['icon'] ?? '',
    );
  }
}
