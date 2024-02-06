import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/bloc/event_bloc.dart';
import 'package:ticketmaster_api/models/events_response/event.dart';
import 'package:ticketmaster_api/repositories/event_repository.dart';
import 'package:ticketmaster_api/repositories/event_repostiroy_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          return EventBloc(eventRepository)..add(EventsFetchEvent());
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Events List"),
            ),
            body: _eventsView(context)));
  }

  Widget _eventsView(BuildContext context) {
    return BlocBuilder<EventBloc, EventState>(
      builder: (context, state) {
      if (state is EventsInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is EventsFetchError){
        return Column(
          children: [
            Text(state.messageError),
             ElevatedButton(onPressed: (){
              context.watch<EventBloc>().add(EventsFetchEvent());
            }, child: const Text("Retry"))
          ],
        );
      }else if (state is EventsFetched){
        return _eventsListView(context, state.eventList);
      }else{
        return const Text("Not supported.");
      }
    });
  }

  Widget _eventsListView(BuildContext context, List<Event> eventsList){
    return ListView.builder(
      itemBuilder: (BuildContext context, int index){
        return Card(
          child: Padding(padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(eventsList[index].images![0].url ?? "")
            ])));
      },
       padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      itemCount: eventsList.length,
    );
  }
}
