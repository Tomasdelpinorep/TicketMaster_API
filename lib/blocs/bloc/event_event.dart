part of 'event_bloc.dart';

@immutable
sealed class EventEvent {}

final class EventsFetchEvent extends EventEvent {}