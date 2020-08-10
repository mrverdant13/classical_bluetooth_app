import 'package:freezed_annotation/freezed_annotation.dart';

import 'bt_device_entity_interface.dart';

part 'bt_device_entity.freezed.dart';

@freezed
abstract class BtDeviceEntity with _$BtDeviceEntity {
  @Implements(BtDeviceEntityInterface)
  const factory BtDeviceEntity({
    @required String macAddress,
    @required String name,
  }) = _BtDeviceEntity;
}
