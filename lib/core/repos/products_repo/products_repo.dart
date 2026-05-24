 import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<void> addproduct(AddProductEntity productEntity);



}