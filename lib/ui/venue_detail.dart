import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/bloc/venue_bloc.dart';
import 'package:ticketmaster_api/models/venue_response/venue.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';
import 'package:ticketmaster_api/repositories/venue_repository_impl.dart';

class VenueDetail extends StatefulWidget {
  final String id;
  const VenueDetail({super.key, required this.id});

  @override
  State<VenueDetail> createState() => _VenueDetailState();
}

class _VenueDetailState extends State<VenueDetail> {
  late VenueRepository venueRepository;
  late VenueBloc _venueBloc;
  String id = '';

  @override
  void initState() {
    super.initState();
    venueRepository = VenueRepositoryImpl();
    _venueBloc = VenueBloc(venueRepository)..add(VenueViewDetail(id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _venueBloc,
      child: Scaffold(),
    );
  }

  Widget _venueDetail(BuildContext context, Venue venueDetail) {
    return BlocBuilder<VenueBloc, VenueBlocState>(builder: (context, state) {
      if (state is VenueBlocInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is VenueFetchError) {
        return Column(
          children: [
            Text(state.errorMessage),
            ElevatedButton(
                onPressed: () {
                  context.watch<VenueBloc>().add(VenueViewDetail(id));
                },
                child: const Text("Volver"))
          ],
        );
      } else if (state is VenueDetail) {
        return Card(
          child: Text(venueDetail.name!),
        );
      } else {
        return const Text('Not supported');
      }
    });
  }
}
