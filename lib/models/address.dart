class Address {
  String? id;
  String? placeId;
  String? formattedAddress;
  String? apartment;
  String number;
  String street;
  String? region;
  String city;
  String county;
  String country;
  String? postcode;

  Address({
    this.id,
    this.placeId,
    this.formattedAddress,
    this.apartment,
    required this.number,
    required this.street,
    this.region,
    required this.city,
    required this.county,
    required this.country,
    this.postcode,
  });
}
