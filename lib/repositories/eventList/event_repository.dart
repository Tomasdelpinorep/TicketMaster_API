import 'package:ticketmaster_api/models/events_response/event.dart';

abstract class EventRepository{
  Future<List<Event>> fetchEvents();

  
}