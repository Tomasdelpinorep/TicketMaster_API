part of 'venue_bloc.dart';

@immutable
sealed class VenueBlocEvent {}

class VenueFetchList extends VenueBlocEvent {
  // final Country country;
  VenueFetchList();
}

class VenueFetchDetail extends VenueBlocEvent {
  final String id;
  VenueFetchDetail(this.id);
}
