import 'dart:convert';

import 'package:http/http.dart';
import 'package:ticketmaster_api/models/event_details/event_details.dart';

import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/models/events_response/events_response.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository.dart';

class EventRepositoryImpl extends EventRepository{
  final Client _client = Client();

  @override
  Future<List<Event>> fetchEvents() async{
    final response = 
      await _client.get(Uri.parse("https://app.ticketmaster.com/discovery/v2/events.json?apikey=pGndTCt0lGcfKooeA9oQcX8domEdbOBI"));
    if (response.statusCode == 200){
      final jsonVal = json.decode(response.body);
      final events = EventsResponse.fromJson(jsonVal).embedded!.events!;
      return events;
    } else {
      throw Exception(response.body);
    }

  }

  @override
  Future<EventDetails> fetchEventDetails(eventId) async{
    final response = await _client.get(Uri.parse("https://app.ticketmaster.com/discovery/v2/events/${eventId}?apikey=pGndTCt0lGcfKooeA9oQcX8domEdbOBI"));

    if(response.statusCode == 200){
      return EventDetails.fromJson(json.decode(response.body));
    }else{
      throw Exception(response.body);
    }
  }
}