import 'package:flutter/material.dart';

class AppointmentSettings extends StatefulWidget {
  const AppointmentSettings({super.key});

  @override
  State<AppointmentSettings> createState() => _AppointmentSettingsState();
}

class _AppointmentSettingsState extends State<AppointmentSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Settings'),
      ),
      body: const Center(
        child: Text(
          'Appointment Settings Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
