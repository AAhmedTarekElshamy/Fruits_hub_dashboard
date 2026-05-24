import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import '../../services/storage_service.dart';
import '../../utils/backend_endpoint.dart';
import 'images_repo.dart';

class ImagesRepoImp implements ImagesRepo {
  final StorageService storageService;

  ImagesRepoImp({required this.storageService});

  @override
  Future<Either<Failure, String>> uploadImage(File image, String path) async {
    try {
      final String fileUrl = await storageService.uploadFile(
        image,
        path.isNotEmpty ? path : BackendEndpoint.images,
      );

      return Right(fileUrl);
    } catch (e) {
      return Left(ServerFailure('${e.toString()}+ failed to upload image'));   // ← Fixed here
    }
  }
}