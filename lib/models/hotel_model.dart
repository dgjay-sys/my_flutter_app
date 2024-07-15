// To parse this JSON data, do
//
//     final hotel = hotelFromJson(jsonString);

import 'dart:convert';

Hotel hotelFromJson(String str) => Hotel.fromJson(json.decode(str));

String hotelToJson(Hotel data) => json.encode(data.toJson());

class Hotel {
  int? hotelId;
  String? hotelName;
  String? hotelDesc;
  String? hotelAddress;
  int? userId;
  String? hotelEmail;
  int? hotelStartingPrice;
  DateTime? createdAt;

  Hotel({
    this.hotelId,
    this.hotelName,
    this.hotelDesc,
    this.hotelAddress,
    this.userId,
    this.hotelEmail,
    this.hotelStartingPrice,
    this.createdAt,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        hotelId: json["hotel_id"],
        hotelName: json["hotel_name"],
        hotelDesc: json["hotel_desc"],
        hotelAddress: json["hotel_address"],
        userId: json["user_id"],
        hotelEmail: json["hotel_email"],
        hotelStartingPrice: json["hotel_starting_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_name": hotelName,
        "hotel_desc": hotelDesc,
        "hotel_address": hotelAddress,
        "user_id": userId,
        "hotel_email": hotelEmail,
        "hotel_starting_price": hotelStartingPrice,
        "created_at": createdAt?.toIso8601String(),
      };
}
