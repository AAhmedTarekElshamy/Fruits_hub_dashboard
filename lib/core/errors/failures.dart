abstract class Failure{
  final String message;

  Failure(  this.message);
}
class ServerFailure extends Failure {
  ServerFailure(super.message);
}
class CacheFailure extends Failure {
  CacheFailure(super.message);
}
class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.message);
}
class EmptyServerFailure extends Failure {
  EmptyServerFailure(super.message);
}
class NoInternetFailure extends Failure {
  NoInternetFailure(super.message);
}
class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}
class UnAuthorizedFailure extends Failure {
  UnAuthorizedFailure(super.message);
}
class BadRequestFailure extends Failure {
  BadRequestFailure(super.message);
}
class NotFoundFailure extends Failure {
  NotFoundFailure(super.message);
}
class ConflictFailure extends Failure {
  ConflictFailure(super.message);
}
class ForbiddenFailure extends Failure {
  ForbiddenFailure(super.message);
}
class NotAcceptableFailure extends Failure {
  NotAcceptableFailure(super.message);
}