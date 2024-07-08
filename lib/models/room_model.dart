// To parse this JSON data, do
//
//     final rooms = roomsFromJson(jsonString);

import 'dart:convert';

Rooms roomsFromJson(String str) => Rooms.fromJson(json.decode(str));

String roomsToJson(Rooms data) => json.encode(data.toJson());

class Rooms {
  int? hotelId;
  String? hotelRoomType;
  String? hotelRoomDesc;
  String? hotelPrice;
  int? noRoom;
  int? noAdult;
  int? noChild;

  Rooms({
    this.hotelId,
    this.hotelRoomType,
    this.hotelRoomDesc,
    this.hotelPrice,
    this.noRoom,
    this.noAdult,
    this.noChild,
  });

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        hotelId: json["hotel_id"],
        hotelRoomType: json["hotel_room_type"],
        hotelRoomDesc: json["hotel_room_desc"],
        hotelPrice: json["hotel_price"],
        noRoom: json["no_room"],
        noAdult: json["no_adult"],
        noChild: json["no_child"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "hotel_room_type": hotelRoomType,
        "hotel_room_desc": hotelRoomDesc,
        "hotel_price": hotelPrice,
        "no_room": noRoom,
        "no_adult": noAdult,
        "no_child": noChild,
      };
}
