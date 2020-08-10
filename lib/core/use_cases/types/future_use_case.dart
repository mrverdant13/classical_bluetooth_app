import 'package:dartz/dartz.dart';

abstract class FutureUseCase<FailureType, ReturnType, UseCaseParameters> {
  const FutureUseCase();

  Future<Either<FailureType, ReturnType>> call(
    UseCaseParameters parameters,
  );
}
