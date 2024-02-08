import 'package:ticketmaster_api/models/event_details/event_details.dart';

abstract class EventDetailsRepository{
  Future<EventDetails> fetchEventDetails(int eventId);
}