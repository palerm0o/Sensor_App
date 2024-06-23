import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/C/BLoC.dart';
import 'package:untitled10/C/states.dart';
import 'package:untitled10/M/sensors_model.dart';
import 'package:untitled10/V/waterpage.dart';
import 'electricitypage.dart';
import 'gaspage.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  static const String id = 'SecondScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 4, 69, 122),
        title: const Text(
          'Notification Center',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                icon: const Icon(Icons.more_vert, color: Colors.white),
                items: const [
                  DropdownMenuItem(
                    value: 'WATER',
                    child: Text('WATER'),
                  ),
                  DropdownMenuItem(
                    value: 'GAS',
                    child: Text('GAS'),
                  ),
                  DropdownMenuItem(
                    value: 'ELECTRICITY',
                    child: Text('Electricity'),
                  ),
                ],
                onChanged: (String? value) {
                  if (value == 'WATER') {
                    _navigateToPage(context, WaterPage.id);
                  } else if (value == 'GAS') {
                    _navigateToPage(context, GasPage.id);
                  } else if (value == 'ELECTRICITY') {
                    _navigateToPage(context, ElectricityPage.id);
                  }
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocConsumer<BLoC, MainState>(
            listener: (context, state) {},
            builder: (context, state) {
              SensorData? loC = BLoC.get(context).sensorData;
              bool hasNotifications = loC!.gassensor.gasvalue > 40 ||
                  loC.watersensor.watervalu == 1 ||
                  loC.ldesensor.ldrvalu == 0;
              if (!hasNotifications) {
                return const Text(
                  'No Notifications Yet',
                  style: TextStyle(fontSize: 40, color: Colors.grey),
                );
              }
              return Column(
                children: [
                  loC.gassensor.gasvalue > 40
                      ? const NotificationItem(
                          title: 'New Gas Alert',
                          subtitle: 'There is a Gas leak !!! ',
                          icon: Icons.fireplace,
                        )
                      : Container(),
                  loC.watersensor.watervalu == 1
                      ? const NotificationItem(
                          title: 'New Water Alert',
                          subtitle: 'There is a water leak !!! ',
                          icon: Icons.opacity,
                        )
                      : Container(),
                  loC.ldesensor.ldrvalu == 0
                      ? const NotificationItem(
                          title: 'New Electricity Alert',
                          subtitle: 'There is a Electricity leak !!! ',
                          icon: Icons.flash_on,
                        )
                      : Container(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String pageId) {
    Navigator.pushNamed(context, pageId);
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const NotificationItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}
