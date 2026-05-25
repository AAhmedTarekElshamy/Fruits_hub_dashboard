 import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

import '../../errors/failures.dart';

abstract class ProductsRepo {
  Future<Either<Failure,void>> addProduct(AddProductEntity productEntity);



}