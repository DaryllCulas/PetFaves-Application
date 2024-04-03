import 'package:flutter/material.dart';

class ChatbotCustomizationScreen extends StatefulWidget {
  const ChatbotCustomizationScreen({super.key});

  @override
  State<ChatbotCustomizationScreen> createState() =>
      _ChatbotCustomizationScreenState();
}

class _ChatbotCustomizationScreenState
    extends State<ChatbotCustomizationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot Customization'),
      ),
      body: const Center(
        child: Text(
          'Chatbot Customization Screen',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
