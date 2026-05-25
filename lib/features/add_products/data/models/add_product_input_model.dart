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
  final int expirationMonths;
  bool isOrganic = false;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;

  AddProductInputModel({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.image,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
  });

  factory AddProductInputModel.fromEntity(AddProductEntity entity) {
    return AddProductInputModel(
      name: entity.name,
      code: entity.code,
      price: entity.price,
      description: entity.description,
      isFeatured: entity.isFeatured,
      image: entity.image,
      expirationMonths: entity.expirationMonths,
      numOfCalories: entity.numOfCalories,
      unitAmount: entity.unitAmount,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'price': price,
      'description': description,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'numOfCalories': numOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
    };
  }
}
