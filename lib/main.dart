import 'package:flutter/material.dart';
import 'package:ticketmaster_api/ui/events_page.dart';
import 'package:ticketmaster_api/ui/home_page.dart';
import 'package:ticketmaster_api/ui/venue_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)
      ),
      routes: {
        '/events':(context) => const EventsPage(),
        'venues':(context) => const VenuePage()
      },
    );
  }
}
