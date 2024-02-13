import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(Icons.event)),
            Tab(icon: Icon(Icons.stadium))
          ]),
        title: const Text('TicketMaster API Project')),
        body: TabBarView(
          children: [
            Container(
              
            )
          ],
        )));
  }
}