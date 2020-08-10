import 'package:dartz/dartz.dart';

abstract class StreamUseCase<FailureType, ReturnType, UseCaseParameters> {
  const StreamUseCase();

  Stream<Either<FailureType, ReturnType>> call(
    UseCaseParameters parameters,
  );
}
