// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'bt_device_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$BtDeviceEntityTearOff {
  const _$BtDeviceEntityTearOff();

// ignore: unused_element
  _BtDeviceEntity call({@required String macAddress, @required String name}) {
    return _BtDeviceEntity(
      macAddress: macAddress,
      name: name,
    );
  }
}

// ignore: unused_element
const $BtDeviceEntity = _$BtDeviceEntityTearOff();

mixin _$BtDeviceEntity {
  String get macAddress;
  String get name;

  $BtDeviceEntityCopyWith<BtDeviceEntity> get copyWith;
}

abstract class $BtDeviceEntityCopyWith<$Res> {
  factory $BtDeviceEntityCopyWith(
          BtDeviceEntity value, $Res Function(BtDeviceEntity) then) =
      _$BtDeviceEntityCopyWithImpl<$Res>;
  $Res call({String macAddress, String name});
}

class _$BtDeviceEntityCopyWithImpl<$Res>
    implements $BtDeviceEntityCopyWith<$Res> {
  _$BtDeviceEntityCopyWithImpl(this._value, this._then);

  final BtDeviceEntity _value;
  // ignore: unused_field
  final $Res Function(BtDeviceEntity) _then;

  @override
  $Res call({
    Object macAddress = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      macAddress:
          macAddress == freezed ? _value.macAddress : macAddress as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$BtDeviceEntityCopyWith<$Res>
    implements $BtDeviceEntityCopyWith<$Res> {
  factory _$BtDeviceEntityCopyWith(
          _BtDeviceEntity value, $Res Function(_BtDeviceEntity) then) =
      __$BtDeviceEntityCopyWithImpl<$Res>;
  @override
  $Res call({String macAddress, String name});
}

class __$BtDeviceEntityCopyWithImpl<$Res>
    extends _$BtDeviceEntityCopyWithImpl<$Res>
    implements _$BtDeviceEntityCopyWith<$Res> {
  __$BtDeviceEntityCopyWithImpl(
      _BtDeviceEntity _value, $Res Function(_BtDeviceEntity) _then)
      : super(_value, (v) => _then(v as _BtDeviceEntity));

  @override
  _BtDeviceEntity get _value => super._value as _BtDeviceEntity;

  @override
  $Res call({
    Object macAddress = freezed,
    Object name = freezed,
  }) {
    return _then(_BtDeviceEntity(
      macAddress:
          macAddress == freezed ? _value.macAddress : macAddress as String,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@Implements(BtDeviceEntityInterface)
class _$_BtDeviceEntity implements _BtDeviceEntity {
  const _$_BtDeviceEntity({@required this.macAddress, @required this.name})
      : assert(macAddress != null),
        assert(name != null);

  @override
  final String macAddress;
  @override
  final String name;

  @override
  String toString() {
    return 'BtDeviceEntity(macAddress: $macAddress, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BtDeviceEntity &&
            (identical(other.macAddress, macAddress) ||
                const DeepCollectionEquality()
                    .equals(other.macAddress, macAddress)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(macAddress) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$BtDeviceEntityCopyWith<_BtDeviceEntity> get copyWith =>
      __$BtDeviceEntityCopyWithImpl<_BtDeviceEntity>(this, _$identity);
}

abstract class _BtDeviceEntity
    implements BtDeviceEntity, BtDeviceEntityInterface {
  const factory _BtDeviceEntity(
      {@required String macAddress, @required String name}) = _$_BtDeviceEntity;

  @override
  String get macAddress;
  @override
  String get name;
  @override
  _$BtDeviceEntityCopyWith<_BtDeviceEntity> get copyWith;
}
