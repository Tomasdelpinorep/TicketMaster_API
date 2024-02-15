import 'package:flutter/material.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';

class EventListItem extends StatefulWidget {
  final Event event;

  const EventListItem({super.key, required this.event});

  @override
  State<EventListItem> createState() => _EventListItemState();
}

class _EventListItemState extends State<EventListItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        SizedBox(
          width: 450,
          height: 200,
          child: Image.network(widget.event.images![1].url ?? "",
              fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: MouseRegion(
            onHover: (event) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (event) {
              setState(() {
                isHovered = false;
              });
            },
            child: AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.blue.withOpacity(0.5),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
