import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    eventRepository = EventRepositoryImpl();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}