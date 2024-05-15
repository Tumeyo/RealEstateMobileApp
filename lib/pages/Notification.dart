import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мэдэгдэл'),
      ),
      body: const Center(
        child: Text(
          'Мэдэгдэл одоогоор байхгүй байна.',
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
