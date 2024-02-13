part of 'venue_bloc.dart';

@immutable
sealed class VenueBlocState {}

final class VenueBlocInitial extends VenueBlocState {}

final class VenueFetchSuccess extends VenueBlocState {
  final List<Venue> venueList;
  VenueFetchSuccess(this.venueList);
}

final class VenueFetchError extends VenueBlocState {
  final String errorMessage;
  VenueFetchError(this.errorMessage);
}
