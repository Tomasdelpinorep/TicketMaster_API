part of 'event_bloc.dart';

@immutable
sealed class EventState {
  final List<Event> events;

  const EventState({
    this.events = const <Event>[],
  });
}

final class EventsInitial extends EventState {}

final class EventsFetched extends EventState{
  final List<Event> eventList;
  const EventsFetched(this.eventList);
}

final class EventsFetchError extends EventState{
  final String messageError;
  const EventsFetchError(this.messageError);
}
