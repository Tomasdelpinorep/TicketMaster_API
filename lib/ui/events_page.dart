import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/event_list/event_bloc.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository.dart';
import 'package:ticketmaster_api/repositories/eventList/event_repository_impl.dart';

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
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Events List"),
            ),
            body: _eventsView(context)));
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
        return _eventsListView(context, state.eventList);
      } else {
        return const Text("Not supported.");
      }
    });
  }

  Widget _eventsListView(BuildContext context, List<Event> eventsList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          surfaceTintColor: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: SizedBox(
                          height: 300,
                          width: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                  eventsList[index].images![0].url ?? "",
                                  fit: BoxFit.cover),
                            ),
                          ))
                    ),
                    Text(eventsList[index].name!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),)
                  ]),
            ));
      },
      itemCount: eventsList.length,
    );
  }
}