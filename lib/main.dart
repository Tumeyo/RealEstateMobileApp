import 'package:flutter/material.dart';
import 'package:realestate_project/theme/color.dart';
import 'pages/login.dart'; // Import the LoginPage widget
import 'pages/root.dart'; // Import the RootApp widget
import 'pages/passforgot.dart'; // Import the PassForgot widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Үл хөдлөх зуучлал',
      theme: ThemeData(
        primaryColor: AppColor.primary, // Use the primary color defined in AppColor
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const RootApp(),
        '/passforgot': (context) => PassForgot(), // Add the route for PassForgot
      },
    );
  }
}
