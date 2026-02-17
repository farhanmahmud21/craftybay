class SliderModel {
  final String id;
  final String photo_url;
  final String description;
  final String brandId;

  SliderModel({
    required this.photo_url,
    required this.description,
    required this.brandId,
    required this.id,
  });

  factory SliderModel.fromJson(Map<String, dynamic> jsonData) {
    return SliderModel(
      photo_url: jsonData['photo_url'],
      description: jsonData['description'],
      brandId: jsonData['brand'],
      id: jsonData['_id'],
    );
  }
}
