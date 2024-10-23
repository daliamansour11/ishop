


import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {

  Address? address;
  int? id;
  String? email;
  String? username;
  String? password;

  String? phone;
  int? v;

  UserEntity({
     this.address,
     this.id,
     this.email,
     this.username,
     this.password,

     this.phone,
     this.v,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    address,
    id,
    email,
    username,
    password,

    phone,
    v,

  ];

}

class Address {
  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });
}


class Geolocation {
  String lat;
  String long;

  Geolocation({
    required this.lat,
    required this.long,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) => Geolocation(
    lat: json["lat"],
    long: json["long"],
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "long": long,
  };
}

class Name {
  String firstname;
  String lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });
}


