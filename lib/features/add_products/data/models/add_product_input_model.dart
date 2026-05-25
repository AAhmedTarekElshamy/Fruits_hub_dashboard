import 'dart:io';

import '../../domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String name;
  final String code;
  final num price;
  final String description;
  final bool isFeatured;
  final File image;
  String? imageUrl;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.image,
    this.imageUrl,
  });
  factory AddProductInputModel.fromEntity(AddProductEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      isFeatured: entity.isFeatured,
      image: entity.image,
      imageUrl: entity.imageUrl,
    );
  }
  toJson(){
    return {
      'name':name,
      'code':code,
      'price':price,
      'description':description,
      'isFeatured':isFeatured,
      'imageUrl':imageUrl,
    };
  }



}
