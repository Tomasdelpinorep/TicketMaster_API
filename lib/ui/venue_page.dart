import 'package:flutter/material.dart';
import 'package:ticketmaster_api/blocs/bloc/venue_bloc.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';
import 'package:ticketmaster_api/repositories/venue_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VenuePage extends StatefulWidget {
  const VenuePage({super.key});

  @override
  State<VenuePage> createState() => _VenuePageState();
}

class _VenuePageState extends State<VenuePage> {
  late VenueRepository venueRepository;

  @override
  void initState() {
    super.initState();
    venueRepository = VenueRepositoryImpl();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VenueBloc(venueRepository)..add(VenueFetchList()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Venues'),
        ),
        body: _venueList(),
      ),
    );
  }
}

Widget _venueList() {
  return BlocBuilder<VenueBloc, VenueBlocState>(builder: (context, state) {
    if (state is VenueFetchSuccess) {
      return ListView.builder(
          itemCount: state.venueList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.venueList[index].name!),
            );
          });
    } else if (state is VenueFetchError) {
      return Text(state.errorMessage);
    } else {
      return const CircularProgressIndicator();
    }
  });
}
