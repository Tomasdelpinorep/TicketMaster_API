import 'package:ticketmaster_api/models/event_details/event_details.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';

abstract class EventRepository{
  Future<List<Event>> fetchEvents();
  Future<EventDetails> fetchEventDetails(eventId);
}
