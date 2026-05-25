import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

import '../../../features/add_products/data/models/add_product_input_model.dart';
import '../../errors/failures.dart';
import '../../services/database_service.dart';
import '../../utils/backend_endpoint.dart';

class ProductsRepoImp implements ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImp({required this.databaseService});
  @override
  Future<Either<Failure,void>> addProduct(AddProductEntity productEntity) async {
     try{
      await databaseService.addData(path: BackendEndpoint.addProduct, data: AddProductInputModel.fromEntity(productEntity).toJson());
      return right(null);
     } catch(e){
return Left(ServerFailure('${e.toString()} - failed to add product'));
     }
  }

}