

import 'dart:convert';

class ProductDetailModel {

String id;
        String title;
        String description;

        List<String>colors;
        List<String>sizes;
        List<String>photos;
        int? regular_price;
        int current_price;
        int quantity;

ProductDetailModel({required this.id,required this.title,required this.description,
required this.colors, required this.sizes, required this.photos, required this.regular_price,required this.current_price,required this.quantity});



factory ProductDetailModel.fromJson(Map<String,dynamic> jsonData){
return ProductDetailModel(id: jsonData['_id'],
 title: jsonData['title'],
 description: jsonData['description'], 
 colors: List<String>.from(jsonData['colors']), 
 sizes: List<String>.from(jsonData['sizes']), 
 photos: List<String>.from(jsonData['photos']),
 regular_price: jsonData['regular_price']?? 0, 
 current_price: jsonData['current_price'], 
 quantity: jsonData['quantity']);

}

}