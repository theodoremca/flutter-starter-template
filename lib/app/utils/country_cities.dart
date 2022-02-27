class City {
  late String country;
  late String city;
  late String code;

  City.fromJson(dynamic json) {
    country = json['country'];
    city = json['city'];
    code = json['code'];
  }
}

class Country {
  late String country;
  late String code;

  Country.fromJson(dynamic json) {
    country = json['name'];
    code = json['code'];
  }
}
