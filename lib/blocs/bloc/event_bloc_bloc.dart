import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_bloc_event.dart';
part 'event_bloc_state.dart';

class EventBlocBloc extends Bloc<EventBlocEvent, EventBlocState> {
  EventBlocBloc() : super(EventBlocInitial()) {
    on<EventBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
