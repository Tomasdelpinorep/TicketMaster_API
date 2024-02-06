import 'package:http/http.dart';

import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/event_repository.dart';

class EventRepositoryImpl extends EventRepository{
  final Client _client = Client();

  @override
  Future<List<Event>> fetchEvents() async{
    final response = 
      await _client.get(Uri.parse("https://app.ticketmaster.com/discovery/v2/events.json?countryCode=ES&apikey=pGndTCt0lGcfKooeA9oQcX8domEdbOBI"));
    

  }
}