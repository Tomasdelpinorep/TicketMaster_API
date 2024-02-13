import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ticketmaster_api/models/venue_response/country.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';

import '../../../models/venue_response/venue.dart';
part 'venue_event.dart';
part 'venue_state.dart';

class VenueBloc extends Bloc<VenueBlocEvent, VenueBlocState> {
  final VenueRepository venueRepository;

  VenueBloc(this.venueRepository) : super(VenueBlocInitial()) {
    on<VenueFetchList>(_onVenueFetchList);
  }

  void _onVenueFetchList(
      VenueFetchList event, Emitter<VenueBlocState> emit) async {
    try {
      final venueList = await venueRepository.fetchVenues();
      emit(VenueFetchSuccess(venueList));
      return;
    } on Exception catch (e) {
      emit(VenueFetchError(e.toString()));
    }
  }
}
