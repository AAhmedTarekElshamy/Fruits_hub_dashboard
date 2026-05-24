

//final getIt = GetIt.instance;

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

import 'fire_storage.dart';

void setupGetIt() {
  GetIt.I.registerSingleton<StorageService>(FireStorage());


}
