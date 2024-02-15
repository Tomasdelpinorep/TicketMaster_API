import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/blocs/bloc/venue_bloc.dart';
import 'package:ticketmaster_api/models/venue_response/venue.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';
import 'package:ticketmaster_api/repositories/venue_repository_impl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VenueDetail extends StatefulWidget {
  final String id;
  const VenueDetail({super.key, required this.id});

  @override
  State<VenueDetail> createState() => _VenueDetailState();
}

class _VenueDetailState extends State<VenueDetail> {
  late VenueRepository venueRepository;
  late VenueBloc _venueBloc;
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  // late Venue venueMaps;

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
                // Column(
                //   children: [googleMaps(context)],
                // )
              ],
            ),
          ),
        );
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  // Widget googleMaps(BuildContext context) {
  //   final double latitude = venueMaps.location?.latitude ?? 0.0;
  //   final double longitude = venueMaps.location?.longitude ?? 0.0;
  //   CameraPosition _kGooglePlex = CameraPosition(
  //     target: LatLng(latitude, longitude),
  //     zoom: 14.4746,
  //   );

  //   const CameraPosition _kLake = CameraPosition(
  //       bearing: 192.8334901395799,
  //       target: LatLng(37.38049329951381, -6.007534638184238),
  //       tilt: 59.440717697143555,
  //       zoom: 19.151926040649414);

  //   return Scaffold(
  //     body: GoogleMap(
  //       mapType: MapType.hybrid,
  //       initialCameraPosition: _kGooglePlex,
  //       onMapCreated: (GoogleMapController controller) {
  //         _controller.complete(controller);
  //       },
  //     ),
  //     // floatingActionButton: FloatingActionButton.extended(
  //     //   onPressed: _goToTheLake,
  //     //   label: const Text('To the lake!'),
  //     //   icon: const Icon(Icons.directions_boat),
  //     // ),
  //   );
  // }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
