part of 'venue_bloc.dart';

@immutable
sealed class VenueBlocState {}

final class VenueBlocInitial extends VenueBlocState {}

// VenueFetchList States
final class VenueFetchListSuccess extends VenueBlocState {
  final List<Venue> venueList;
  VenueFetchListSuccess(this.venueList);
}

final class VenueFetchListError extends VenueBlocState {
  final String errorMessage;
  VenueFetchListError(this.errorMessage);
}

// VenueFetchDetail States
final class VenueFetchDetailSuccess extends VenueBlocState {
  final Venue venueDetail;
  VenueFetchDetailSuccess(this.venueDetail);
}

final class VenueFetchDetailError extends VenueBlocState {
  final String errorMessage;
  VenueFetchDetailError(this.errorMessage);
}
