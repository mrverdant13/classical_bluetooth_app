import 'package:freezed_annotation/freezed_annotation.dart';

part 'no_parameters.freezed.dart';

@freezed
abstract class NoUseCaseParameters with _$NoUseCaseParameters {
  const factory NoUseCaseParameters() = _NoUseCaseParameters;
}
