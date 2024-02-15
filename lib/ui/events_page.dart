import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/event_list/event_bloc.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository_impl.dart';
import 'package:ticketmaster_api/ui/event_details_page.dart';
import 'package:ticketmaster_api/widgets/events_list_item_widget.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late EventRepository eventRepository;

  @override
  void initState() {
    super.initState();
    eventRepository = EventRepositoryImpl();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return EventBloc(eventRepository)..add(EventsFetchList());
        },
        child: Scaffold(body: _eventsView(context)));
  }

  Widget _eventsView(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(builder: (context, state) {
      if (state is EventsInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is EventsFetchError) {
        return Column(
          children: [
            Text(state.messageError),
            ElevatedButton(
                onPressed: () {
                  context.watch<EventBloc>().add(EventsFetchList());
                },
                child: const Text("Retry"))
          ],
        );
      } else if (state is EventsFetched) {
        return _eventListView(context, state.eventList);
      } else {
        return const Text("Not supported.");
      }
    });
  }

  Widget _eventListView(BuildContext context, List<Event> eventsList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EventDetailsPage(eventId: eventsList[index].id);
                })),
            child: EventListItem(event: eventsList[index]));
      },
      itemCount: eventsList.length,
    );
  }
}
