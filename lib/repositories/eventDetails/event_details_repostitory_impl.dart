import 'dart:convert';

import 'package:http/http.dart';
import 'package:ticketmaster_api/models/event_details/event_details.dart';
import 'package:ticketmaster_api/repositories/eventDetails/event_details_repository.dart';

class EventDetailsRepositoryImpl extends EventDetailsRepository{
  final Client _client = Client();

  @override
  Future<EventDetails> fetchEventDetails(eventId) async{
    final response = 
      await _client.get(Uri.parse("https://app.ticketmaster.com/discovery/v2/events/${eventId}?apikey=pGndTCt0lGcfKooeA9oQcX8domEdbOBI"));

      if(response.statusCode == 200){
        return(EventDetails.fromJson(json.decode(response.body)));
      }else{
        throw Exception(response.body);
      }
  }
}