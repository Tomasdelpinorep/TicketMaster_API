import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/bloc/venue_bloc.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';
import 'package:ticketmaster_api/repositories/venue_repository_impl.dart';

class VenueDetail extends StatefulWidget {
  const VenueDetail({super.key});

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
}