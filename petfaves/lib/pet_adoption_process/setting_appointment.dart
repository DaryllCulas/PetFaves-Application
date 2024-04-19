import 'package:flutter/material.dart';

class SettingAppointment extends StatefulWidget {
  const SettingAppointment({super.key});

  @override
  State<SettingAppointment> createState() => _SettingAppointmentState();
}

class _SettingAppointmentState extends State<SettingAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Appointment'),
      ),
      body: const Center(
        child: Text(
          'Setting Appointment Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
