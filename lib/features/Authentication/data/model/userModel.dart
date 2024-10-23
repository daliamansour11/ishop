

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {


  UserModel({
    Address? address,
    int? id,
    String ?email,
    String ?username,
    String ?password,

    String? phone,
    int? v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    // address: Address.fromJson(json["address"]),
    id: json["id"],
    email: json["email"],
    username: json["username"],
    password: json["password"],

    phone: json["phone"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    // "address": address,
    "id": id,
    "email": email,
    "username": username,
    "password": password,

    "phone": phone,
    "__v": v,
  };
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    geolocation: Geolocation.fromJson(json["geolocation"]),
    city: json["city"],
    street: json["street"],
    number: json["number"],
    zipcode: json["zipcode"],
  );

  Map<String, dynamic> toJson() => {
    "geolocation": geolocation.toJson(),
    "city": city,
    "street": street,
    "number": number,
    "zipcode": zipcode,
  };
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
  String? firstname;
  String? lastname;

  Name({
    required this.firstname,
    required this.lastname,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    firstname: json["firstname"],
    lastname: json["lastname"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
  };
}
