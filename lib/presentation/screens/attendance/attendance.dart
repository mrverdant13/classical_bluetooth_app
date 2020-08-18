import 'package:classical_bluetooth_app/domain/entities/bt_device/bt_device_entity.dart';
import 'package:classical_bluetooth_app/presentation/ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendanceScreen extends StatelessWidget {
  final BtDeviceEntity btDevice;
  final int maxCapacity;

  const AttendanceScreen({
    @required this.btDevice,
    @required this.maxCapacity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ReceivedDataFromBtDeviceCubit,
            ReceivedDataFromBtDeviceState>(
          builder: (context, receivedDataFromBtDeviceState) {
            return receivedDataFromBtDeviceState.when(
              failure: () => const Center(
                child: Text(
                  'Hubo un error al recibir datos',
                ),
              ),
              idle: () => const Center(
                child: Text(
                  'A la espera de datos',
                ),
              ),
              received: (dataString) {
                final currentAttendance = int.tryParse(dataString) ?? 0;
                final isOk = currentAttendance < (maxCapacity / 2);
                return Container(
                  color: isOk ? Colors.green : Colors.red,
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: FittedBox(
                          child: isOk
                              ? CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Image.network(
                                      'https://www.pngmart.com/files/10/Thumbs-UP-PNG-Transparent-Image.png',
                                    ),
                                  ),
                                )
                              : Image.network(
                                  'https://images.vexels.com/media/users/3/143473/isolated/preview/6a4a5a7dd733d452adfd328c32f50d3e-icono-de-se--al-de-stop-mano-by-vexels.png',
                                ),
                        ),
                      ),
                      Expanded(
                        child: FittedBox(
                          child: Text(
                            isOk ? 'PUEDE\nINGRESAR' : 'AFORO\nALCANZADO',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: FittedBox(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '$currentAttendance',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50.0,
                              ),
                              children: [
                                TextSpan(
                                  text: '/$maxCapacity',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              // Center(
              //   child: Text(
              //     'Cantidad actual de personas: $dataString',
              //   ),
              // ),
            );
          },
        ),
      ),
    );
  }
}
