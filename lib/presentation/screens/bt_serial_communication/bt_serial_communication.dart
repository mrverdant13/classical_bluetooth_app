import 'package:flutter/material.dart';

import '../../../domain/entities/bt_device/bt_device_entity.dart';

class BtSerialCommunicationScreen extends StatelessWidget {
  final BtDeviceEntity btDevice;

  const BtSerialCommunicationScreen({
    @required this.btDevice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          btDevice.name,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          btDevice.macAddress,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: Colors.blue.shade700,
                    onPressed: () {},
                    child: const Text(
                      'CONECTAR',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
