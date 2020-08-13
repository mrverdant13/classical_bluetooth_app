import 'package:freezed_annotation/freezed_annotation.dart';

part 'bt_connection_state.freezed.dart';

@freezed
abstract class BtConnectionState with _$BtConnectionState {
  const factory BtConnectionState.connected() = _BtConnectionStateConnected;
  const factory BtConnectionState.connecting() = _BtConnectionStateConnecting;
  const factory BtConnectionState.disconnected() =
      _BtConnectionStateDisconnected;
  const factory BtConnectionState.failure({
    String message,
  }) = _BtConnectionStateFailure;
}
