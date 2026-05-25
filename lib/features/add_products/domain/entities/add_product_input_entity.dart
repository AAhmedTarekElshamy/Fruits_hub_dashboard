import 'dart:io';

class AddProductEntity {
  final String name;
  final String code;
  final num price;
  final String description;
  final bool isFeatured;
  final File image;
  String? imageUrl;

  AddProductEntity({required this.name, required this.code, required this.price, required this.description, required this.isFeatured, required this.image, required this.imageUrl});


}
