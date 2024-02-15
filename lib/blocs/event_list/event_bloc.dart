import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ticketmaster_api/models/event_details/event_details.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository eventRepository;

  EventBloc(this.eventRepository) : super(EventsInitial()) {
    on<EventsFetchList>(_onEventsFetch);
    on<EventFetchDetails>(_onEventFetchDetails);
  }

  void _onEventsFetch(
    EventsFetchList event, Emitter<EventState> emit) async{
      try{
        final eventsList = await eventRepository.fetchEvents();
        emit(EventsFetched(eventsList));
        return;
      } on Exception catch (e){
        emit(EventsFetchError(e.toString()));
      }
    }

    void _onEventFetchDetails(EventFetchDetails event, Emitter<EventState> emit) async{
      try{
        final eventDetails = await eventRepository.fetchEventDetails(event.eventId);
        emit(EventDetailsFetched(eventDetails));
        return;
      }on Exception catch(e){
        emit(EventsFetchError(e.toString()));
      }
    }
}
