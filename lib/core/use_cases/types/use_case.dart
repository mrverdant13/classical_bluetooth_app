import 'package:dartz/dartz.dart';

abstract class UseCase<FailureType, ReturnType, UseCaseParameters> {
  const UseCase();

  Either<FailureType, ReturnType> call(
    UseCaseParameters parameters,
  );
}
