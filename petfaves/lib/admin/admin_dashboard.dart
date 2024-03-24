import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        iconTheme: const IconThemeData(
            color:
                Color.fromARGB(255, 79, 149, 240)), // Set icon color to black
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Navigation
            ListTile(
              leading: const Icon(Icons.dashboard,
                  color: Colors.black), // Set icon color to black
              title: const Text('Dashboard',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Handle navigation to the dashboard page
              },
            ),
            ListTile(
              leading: const Icon(Icons.people,
                  color: Colors.black), // Set icon color to black
              title: const Text('Users',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Handle navigation to the users page
              },
            ),
            ListTile(
              leading: const Icon(Icons.pets,
                  color: Colors.black), // Set icon color to black
              title: const Text('Pets',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Handle navigation to the pets page
              },
            ),
            // Statistics
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black
                ),
              ),
            ),
            // Example statistic widgets
            Container(
              height: 100,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Total Users: 100',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 100,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text(
                  'Total Pets: 50',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            // Data Management
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Data Management',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.add,
                  color: Colors.black), // Set icon color to black
              title: const Text('Add User',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Handle adding a new user
              },
            ),
            ListTile(
              leading: const Icon(Icons.add,
                  color: Colors.black), // Set icon color to black
              title: const Text('Add Pet',
                  style: TextStyle(
                      color: Colors.black)), // Set text color to black
              onTap: () {
                // Handle adding a new pet
              },
            ),
          ],
        ),
      ),
    );
  }
}
