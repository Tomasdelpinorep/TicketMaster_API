part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

class EventsFetchList extends EventEvent {}

class EventFetchDetails extends EventEvent{
  final String? eventId;
  EventFetchDetails(this.eventId);
}

