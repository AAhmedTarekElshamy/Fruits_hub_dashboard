import 'dart:io';

class AddProductEntity {
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

  AddProductEntity({
    required this.name,
    required this.code,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.image,
    required this.expirationMonths,
    required this.numOfCalories,
    required this.unitAmount,
    this.imageUrl,
  });
}