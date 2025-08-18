import 'package:flutter/material.dart';
import 'screens/bio_input_step1.dart';
import 'screens/bio_input_step2.dart';
import 'screens/dashboard_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(); // Load the .env file
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Performance App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/bio1',
      routes: {
        '/bio1': (context) => const BioInputStep1(),
        '/bio2': (context) => const BioInputStep2(),
        '/dashboard': (context) => const DashboardScreen(),
      },
    );
  }
}
