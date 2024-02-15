import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/bloc/venues/venue_bloc.dart';
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

  static const textStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 35,
  );

  @override
  void initState() {
    super.initState();
    venueRepository = VenueRepositoryImpl();
    _venueBloc = VenueBloc(venueRepository)..add(VenueFetchDetail(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _venueBloc,
      child: Scaffold(
        body: _venueDetail(context),
      ),
    );
  }

  Widget _venueDetail(BuildContext context) {
    return BlocBuilder<VenueBloc, VenueBlocState>(builder: (context, state) {
      if (state is VenueFetchDetailError) {
        return Column(
          children: [
            Text(state.errorMessage),
            ElevatedButton(
                onPressed: () {
                  context.watch<VenueBloc>().add(VenueFetchDetail(widget.id));
                },
                child: const Text("Reintentar"))
          ],
        );
      } else if (state is VenueFetchDetailSuccess) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Column(
              children: [
                if (state.venueDetail.images != null &&
                    state.venueDetail.images!.isNotEmpty)
                  Image.network(
                    state.venueDetail.images![0].url!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                else
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      state.venueDetail.name!,
                      style: textStyle,
                    ),
                  )),
              ],
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
