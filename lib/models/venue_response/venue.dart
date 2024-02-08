import 'dart:convert';

import 'ada.dart';
import 'address.dart';
import 'box_office_info.dart';
import 'city.dart';
import 'country.dart';
import 'dma.dart';
import 'general_info.dart';
import 'image.dart';
import 'links.dart';
import 'location.dart';
import 'market.dart';
import 'social.dart';
import 'state.dart';
import 'upcoming_events.dart';

class Venue {
  String? name;
  String? type;
  String? id;
  bool? test;
  String? url;
  String? locale;
  List<dynamic>? aliases;
  List<Image>? images;
  String? postalCode;
  String? timezone;
  City? city;
  State? state;
  Country? country;
  Address? address;
  Location? location;
  List<Market>? markets;
  List<Dma>? dmas;
  Social? social;
  BoxOfficeInfo? boxOfficeInfo;
  String? parkingDetail;
  String? accessibleSeatingDetail;
  GeneralInfo? generalInfo;
  UpcomingEvents? upcomingEvents;
  Ada? ada;
  Links? links;

  Venue({
    this.name,
    this.type,
    this.id,
    this.test,
    this.url,
    this.locale,
    this.aliases,
    this.images,
    this.postalCode,
    this.timezone,
    this.city,
    this.state,
    this.country,
    this.address,
    this.location,
    this.markets,
    this.dmas,
    this.social,
    this.boxOfficeInfo,
    this.parkingDetail,
    this.accessibleSeatingDetail,
    this.generalInfo,
    this.upcomingEvents,
    this.ada,
    this.links,
  });

  factory Venue.fromVenueResponse(Map<String, dynamic> data) => Venue(
        name: data['name'] as String?,
        type: data['type'] as String?,
        id: data['id'] as String?,
        test: data['test'] as bool?,
        url: data['url'] as String?,
        locale: data['locale'] as String?,
        aliases: data['aliases'] as List<dynamic>?,
        images: (data['images'] as List<dynamic>?)
            ?.map((e) => Image.fromVenueResponse(e as Map<String, dynamic>))
            .toList(),
        postalCode: data['postalCode'] as String?,
        timezone: data['timezone'] as String?,
        city: data['city'] == null
            ? null
            : City.fromVenueResponse(data['city'] as Map<String, dynamic>),
        state: data['state'] == null
            ? null
            : State.fromVenueResponse(data['state'] as Map<String, dynamic>),
        country: data['country'] == null
            ? null
            : Country.fromVenueResponse(
                data['country'] as Map<String, dynamic>),
        address: data['address'] == null
            ? null
            : Address.fromVenueResponse(
                data['address'] as Map<String, dynamic>),
        location: data['location'] == null
            ? null
            : Location.fromVenueResponse(
                data['location'] as Map<String, dynamic>),
        markets: (data['markets'] as List<dynamic>?)
            ?.map((e) => Market.fromVenueResponse(e as Map<String, dynamic>))
            .toList(),
        dmas: (data['dmas'] as List<dynamic>?)
            ?.map((e) => Dma.fromVenueResponse(e as Map<String, dynamic>))
            .toList(),
        social: data['social'] == null
            ? null
            : Social.fromVenueResponse(data['social'] as Map<String, dynamic>),
        boxOfficeInfo: data['boxOfficeInfo'] == null
            ? null
            : BoxOfficeInfo.fromVenueResponse(
                data['boxOfficeInfo'] as Map<String, dynamic>),
        parkingDetail: data['parkingDetail'] as String?,
        accessibleSeatingDetail: data['accessibleSeatingDetail'] as String?,
        generalInfo: data['generalInfo'] == null
            ? null
            : GeneralInfo.fromVenueResponse(
                data['generalInfo'] as Map<String, dynamic>),
        upcomingEvents: data['upcomingEvents'] == null
            ? null
            : UpcomingEvents.fromVenueResponse(
                data['upcomingEvents'] as Map<String, dynamic>),
        ada: data['ada'] == null
            ? null
            : Ada.fromVenueResponse(data['ada'] as Map<String, dynamic>),
        links: data['_links'] == null
            ? null
            : Links.fromVenueResponse(data['_links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toVenueResponse() => {
        'name': name,
        'type': type,
        'id': id,
        'test': test,
        'url': url,
        'locale': locale,
        'aliases': aliases,
        'images': images?.map((e) => e.toVenueResponse()).toList(),
        'postalCode': postalCode,
        'timezone': timezone,
        'city': city?.toVenueResponse(),
        'state': state?.toVenueResponse(),
        'country': country?.toVenueResponse(),
        'address': address?.toVenueResponse(),
        'location': location?.toVenueResponse(),
        'markets': markets?.map((e) => e.toVenueResponse()).toList(),
        'dmas': dmas?.map((e) => e.toVenueResponse()).toList(),
        'social': social?.toVenueResponse(),
        'boxOfficeInfo': boxOfficeInfo?.toVenueResponse(),
        'parkingDetail': parkingDetail,
        'accessibleSeatingDetail': accessibleSeatingDetail,
        'generalInfo': generalInfo?.toVenueResponse(),
        'upcomingEvents': upcomingEvents?.toVenueResponse(),
        'ada': ada?.toVenueResponse(),
        '_links': links?.toVenueResponse(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Venue].
  factory Venue.fromJson(String data) {
    return Venue.fromVenueResponse(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Venue] to a JSON string.
  String toJson() => json.encode(toVenueResponse());
}
