import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../repositories/venue_repository.dart';

import '../../models/venue_response/venue.dart';

part 'venue_event.dart';
part 'venue_state.dart';

class VenueBloc extends Bloc<VenueBlocEvent, VenueBlocState> {
  final VenueRepository venueRepository;

  VenueBloc(this.venueRepository) : super(VenueBlocInitial()) {
    on<VenueFetchList>(_onVenueFetchList);
    on<VenueFetchDetail>(_onVenueFetchDetail);
  }

  void _onVenueFetchList(
      VenueFetchList venue, Emitter<VenueBlocState> emit) async {
    try {
      final venueList = await venueRepository.fetchVenues();
      emit(VenueFetchListSuccess(venueList));
      return;
    } on Exception catch (e) {
      emit(VenueFetchListError(e.toString()));
    }
  }

  void _onVenueFetchDetail(
      VenueFetchDetail venue, Emitter<VenueBlocState> emit) async {
    try {
      final venueDetail = await venueRepository.fetchVenueDetails(venue.id);
      emit(VenueFetchDetailSuccess(venueDetail));
      return;
    } on Exception catch (e) {
      emit(VenueFetchDetailError(e.toString()));
    }
  }
}
