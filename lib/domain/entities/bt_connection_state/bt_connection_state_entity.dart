import 'package:freezed_annotation/freezed_annotation.dart';

part 'bt_connection_state_entity.freezed.dart';

@freezed
abstract class BtConnectionStateEntity with _$BtConnectionStateEntity {
  const factory BtConnectionStateEntity.connected() =
      _BtConnectionStateEntityConnected;
  const factory BtConnectionStateEntity.changing() =
      _BtConnectionStateEntityChanging;
  const factory BtConnectionStateEntity.disconnected() =
      _BtConnectionStateEntityDisconnected;
  const factory BtConnectionStateEntity.failure({
    @required String message,
  }) = _BtConnectionStateEntityFailure;
}
