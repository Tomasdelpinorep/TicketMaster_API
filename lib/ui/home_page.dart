import 'package:flutter/material.dart';
import 'package:ticketmaster_api/ui/events_page.dart';
import 'package:ticketmaster_api/ui/venue_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.event)),
              Tab(icon: Icon(Icons.stadium)),
            ]),
            title: const Text('TicketMaster API'),
            centerTitle: true,
          ),
          body: const TabBarView(children: [EventsPage(), VenuePage()]),
        ));
  }
}
