import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../ui_logic_holders/jay_counter_current_setup_change_notifier/jay_counter_current_setup_change_notifier.dart';
import '../../ui_logic_holders/received_data_from_bt_device_cubit/received_data_from_bt_device_cubit.dart';

class NumberOfPeopleScreen extends StatelessWidget {
  const NumberOfPeopleScreen();

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
                final isOk = currentAttendance <
                    (context
                        .watch<JayCounterCurrentSetupChangeNotifier>()
                        .maxCapacity);
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
                                    child: Image.asset(
                                      'assets/images/number_of_people/go.png',
                                    ),
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/number_of_people/stop.png',
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
                                  text:
                                      '/${context.watch<JayCounterCurrentSetupChangeNotifier>().maxCapacity}',
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
            );
          },
        ),
      ),
    );
  }
}
