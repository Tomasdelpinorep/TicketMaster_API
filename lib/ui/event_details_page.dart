import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/event_list/event_bloc.dart';
import 'package:ticketmaster_api/models/event_details/event_details.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository_impl.dart';

class EventDetailsPage extends StatefulWidget {
  final String? eventId;

  const EventDetailsPage({super.key, required this.eventId});
  
  @override
  State<EventDetailsPage> createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late EventRepository eventRepository;

  @override
  void initState(){
    super.initState();
    eventRepository = EventRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context){
      return EventBloc(eventRepository)..add(EventFetchDetails(widget.eventId));
    },
    child: Scaffold(
      body:_eventDetailsView(context))
    ); 
  }

  Widget _eventDetailsView(BuildContext context){
    return BlocBuilder<EventBloc, EventState>(builder: (context,state){
      if (state is EventsInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is EventsFetchError) {
        return Column(
          children: [
            Text(state.messageError),
            ElevatedButton(
                onPressed: () {
                  context.watch<EventBloc>().add(EventFetchDetails(widget.eventId));
                },
                child: const Text("Retry"))
          ],
        );
      } else if (state is EventDetailsFetched) {
        return _eventDetailsWidget(context, state.eventDetails);
      } else {
        return const Text("Not supported.");
      }
    });
  }

  Widget _eventDetailsWidget(BuildContext context, EventDetails eventDetails){
    return Text(eventDetails.name!);
  }
}