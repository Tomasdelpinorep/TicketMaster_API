part of 'venue_bloc.dart';

@immutable
sealed class VenueBlocEvent {}

class VenueFetchList extends VenueBlocEvent {
  // final Country country;
  VenueFetchList();
}

class VenueViewDetail extends VenueBlocEvent {
  final String id;
  VenueViewDetail(this.id);
}
