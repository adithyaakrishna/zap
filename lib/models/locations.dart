import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  final String? address;
  final String? id;
  final String? image;
  final String? lat;
  final String? lng;
  final String? name;
  final String? phone;
  final String? region;

  LocationModel(
      {this.address,
      this.id,
      this.image,
      this.lat,
      this.lng,
      this.name,
      this.phone,
      this.region});

  List<LocationModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return LocationModel(
        address: dataMap['address'],
        id: dataMap['id'],
        image: dataMap['image'],
        lat: dataMap['lat'],
        lng: dataMap['lng'],
        name: dataMap['name'],
        phone: dataMap['phone'],
        region: dataMap['region'],
      );
    }).toList();
  }
}
