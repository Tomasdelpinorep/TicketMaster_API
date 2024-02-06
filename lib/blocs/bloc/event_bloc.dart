import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/event_repository.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final EventRepository eventRepository;

  EventBloc(this.eventRepository) : super(EventsInitial()) {
    on<EventsFetchEvent>(_onEventsFetch);
  }

  void _onEventsFetch(
    EventsFetchEvent event, Emitter<EventState> emit) async{
      try{
        final eventsList = await eventRepository.fetchEvents();
        emit(EventsFetched(eventsList));
        return;
      } on Exception catch (e){
        emit(EventsFetchError(e.toString()));
      }
    }
}
