import '../models/venue_response/venue.dart';

abstract class VenueRepository {
  Future<List<Venue>> fetchVenues();
  Future<Venue> fetchVenueDetails(String id);
}
