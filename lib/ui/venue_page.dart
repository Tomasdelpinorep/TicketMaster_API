import 'package:flutter/material.dart';
import 'package:ticketmaster_api/blocs/bloc/venues/venue_bloc.dart';
import 'package:ticketmaster_api/repositories/venue_repository.dart';
import 'package:ticketmaster_api/repositories/venue_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticketmaster_api/ui/venue_detail.dart';

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
        body: _venueList(),
      ),
    );
  }
}

const textStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

Widget _venueList() {
  return BlocBuilder<VenueBloc, VenueBlocState>(builder: (context, state) {
    if (state is VenueFetchListSuccess) {
      return ListView.builder(
          itemCount: state.venueList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VenueDetail(
                              id: state.venueList[index].id!,
                            ))),
                child: Card(
                  elevation: 8,
                  surfaceTintColor: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        state.venueList[index].name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const Divider(),
                      if (state.venueList[index].images != null &&
                          state.venueList[index].images!.isNotEmpty)
                        Image.network(
                          state.venueList[index].images![0].url!,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      else
                        Image.asset('assets/images/event.jpg'),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                state.venueList[index].city!.name!,
                                style: textStyle,
                              ),
                              const Text(' - ', style: textStyle),
                              Text(state.venueList[index].country!.countryCode!,
                                  style: textStyle)
                            ]),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.only(right: 12),
                      //       child: ElevatedButton(
                      //         onPressed: () {
                      //           Navigator.push(
                      //               context,
                      //               MaterialPageRoute(
                      //                   builder: (context) => VenueDetail(
                      //                         id: state.venueList[index].id!,
                      //                       )));
                      //         },
                      //         style: ButtonStyle(
                      //             minimumSize: MaterialStateProperty.all(
                      //                 const Size(30, 30)),
                      //             backgroundColor: MaterialStateProperty.all(
                      //                 Colors.lightBlue)),
                      //         child: const Text(
                      //           'Info',
                      //           style: TextStyle(
                      //               color: Colors.black,
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 15),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  ),
                ),
              ),
            );
          });
    } else if (state is VenueFetchListError) {
      return Text(state.errorMessage);
    } else {
      return const CircularProgressIndicator();
    }
  });
}
