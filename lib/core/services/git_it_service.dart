

//final getIt = GetIt.instance;

import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_service.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import '../repos/images_repo/images_repo.dart';
import '../repos/products_repo/products_repo.dart';
import '../repos/products_repo/products_repo_imp.dart';
import 'database_service.dart';
import 'fire_storage.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<StorageService>(FireStorage());
  GetIt.I.registerSingleton<ImagesRepo>(ImagesRepoImp(storageService:GetIt.I<StorageService>()));
  GetIt.I.registerSingleton<DatabaseService>(FireStoreService());
  GetIt.I.registerSingleton<ProductsRepo>(
    ProductsRepoImp(databaseService: GetIt.I<DatabaseService>()));


}
