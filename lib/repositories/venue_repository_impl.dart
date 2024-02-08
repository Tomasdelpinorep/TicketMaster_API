import 'dart:convert';

import 'package:http/http.dart';
import 'package:ticketmaster_api/models/venue_response/venue.dart';
import 'package:ticketmaster_api/models/venue_response/venue_response.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';

class VenueRepositoryImpl extends VenueRepository {
  final Client _httpClient = Client();

  @override
  Future<Venue> fetchVenueDetails(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Venue>> fetchVenues() async {
    final response = await _httpClient.get(Uri.parse(
        'https://app.ticketmaster.com/discovery/v2/venues.json?apikey=pGndTCt0lGcfKooeA9oQcX8domEdbOBI'));
    if (response.statusCode == 200) {
      return VenueResponse.fromJson(response.body).embedded!.venues!;
    } else {
      throw Exception('Failed to load venues');
    }
  }
}
