part of 'bt_connection_manager_cubit.dart';

@freezed
abstract class BtConnectionManagerState with _$BtConnectionManagerState {
  const factory BtConnectionManagerState.idle() = _BtConnectionManagerStateIdle;
  const factory BtConnectionManagerState.message(
    String message,
  ) = _BtConnectionManagerStateMessage;
}
