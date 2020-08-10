// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bluetooth_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$WatchStatusFailureTearOff {
  const _$WatchStatusFailureTearOff();

// ignore: unused_element
  _WatchStatusFailureUnexpected unexpected() {
    return const _WatchStatusFailureUnexpected();
  }
}

// ignore: unused_element
const $WatchStatusFailure = _$WatchStatusFailureTearOff();

mixin _$WatchStatusFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_WatchStatusFailureUnexpected value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_WatchStatusFailureUnexpected value),
    @required Result orElse(),
  });
}

abstract class $WatchStatusFailureCopyWith<$Res> {
  factory $WatchStatusFailureCopyWith(
          WatchStatusFailure value, $Res Function(WatchStatusFailure) then) =
      _$WatchStatusFailureCopyWithImpl<$Res>;
}

class _$WatchStatusFailureCopyWithImpl<$Res>
    implements $WatchStatusFailureCopyWith<$Res> {
  _$WatchStatusFailureCopyWithImpl(this._value, this._then);

  final WatchStatusFailure _value;
  // ignore: unused_field
  final $Res Function(WatchStatusFailure) _then;
}

abstract class _$WatchStatusFailureUnexpectedCopyWith<$Res> {
  factory _$WatchStatusFailureUnexpectedCopyWith(
          _WatchStatusFailureUnexpected value,
          $Res Function(_WatchStatusFailureUnexpected) then) =
      __$WatchStatusFailureUnexpectedCopyWithImpl<$Res>;
}

class __$WatchStatusFailureUnexpectedCopyWithImpl<$Res>
    extends _$WatchStatusFailureCopyWithImpl<$Res>
    implements _$WatchStatusFailureUnexpectedCopyWith<$Res> {
  __$WatchStatusFailureUnexpectedCopyWithImpl(
      _WatchStatusFailureUnexpected _value,
      $Res Function(_WatchStatusFailureUnexpected) _then)
      : super(_value, (v) => _then(v as _WatchStatusFailureUnexpected));

  @override
  _WatchStatusFailureUnexpected get _value =>
      super._value as _WatchStatusFailureUnexpected;
}

class _$_WatchStatusFailureUnexpected implements _WatchStatusFailureUnexpected {
  const _$_WatchStatusFailureUnexpected();

  @override
  String toString() {
    return 'WatchStatusFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WatchStatusFailureUnexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
  }) {
    assert(unexpected != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_WatchStatusFailureUnexpected value),
  }) {
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_WatchStatusFailureUnexpected value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _WatchStatusFailureUnexpected implements WatchStatusFailure {
  const factory _WatchStatusFailureUnexpected() =
      _$_WatchStatusFailureUnexpected;
}
