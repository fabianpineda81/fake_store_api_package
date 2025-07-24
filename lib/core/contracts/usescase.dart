import 'package:api_connections_package/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, Params>{
  const UseCase();
  Future<Either<Failure, Type>> execute(Params params);
}