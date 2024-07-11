// To parse this JSON data, do
//
//     final reserve = reserveFromJson(jsonString);

import 'dart:convert';

Reserve reserveFromJson(String str) => Reserve.fromJson(json.decode(str));

String reserveToJson(Reserve data) => json.encode(data.toJson());

class Reserve {
  int? hotelId;
  int? userId;
  String? hotelName;
  String? hotelTypeRoom;
  DateTime? dateDepart;
  DateTime? dateReturn;
  int? totalPayment;
  String? reserveStatus;
  String? hotelDesc;
  String? hotelEmail;
  int? hotelStartingPrice;
  DateTime? createdAt;
  String? hotelRoomType;
  String? hotelRoomDesc;
  String? hotelPrice;
  int? noRoom;
  int? noAdult;
  int? noChild;

  Reserve({
    this.hotelId,
    this.userId,
    this.hotelName,
    this.hotelTypeRoom,
    this.dateDepart,
    this.dateReturn,
    this.totalPayment,
    this.reserveStatus,
    this.hotelDesc,
    this.hotelEmail,
    this.hotelStartingPrice,
    this.createdAt,
    this.hotelRoomType,
    this.hotelRoomDesc,
    this.hotelPrice,
    this.noRoom,
    this.noAdult,
    this.noChild,
  });

  factory Reserve.fromJson(Map<String, dynamic> json) => Reserve(
        hotelId: json["hotel_id"],
        userId: json["user_id"],
        hotelName: json["hotel_name"],
        hotelTypeRoom: json["hotel_type_room"],
        dateDepart: json["date_depart"] == null
            ? null
            : DateTime.parse(json["date_depart"]),
        dateReturn: json["date_return"] == null
            ? null
            : DateTime.parse(json["date_return"]),
        totalPayment: json["total_payment"],
        reserveStatus: json["reserve_status"],
        hotelDesc: json["hotel_desc"],
        hotelEmail: json["hotel_email"],
        hotelStartingPrice: json["hotel_starting_price"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        hotelRoomType: json["hotel_room_type"],
        hotelRoomDesc: json["hotel_room_desc"],
        hotelPrice: json["hotel_price"],
        noRoom: json["no_room"],
        noAdult: json["no_adult"],
        noChild: json["no_child"],
      );

  Map<String, dynamic> toJson() => {
        "hotel_id": hotelId,
        "user_id": userId,
        "hotel_name": hotelName,
        "hotel_type_room": hotelTypeRoom,
        "date_depart": dateDepart?.toIso8601String(),
        "date_return": dateReturn?.toIso8601String(),
        "total_payment": totalPayment,
        "reserve_status": reserveStatus,
        "hotel_desc": hotelDesc,
        "hotel_email": hotelEmail,
        "hotel_starting_price": hotelStartingPrice,
        "created_at": createdAt?.toIso8601String(),
        "hotel_room_type": hotelRoomType,
        "hotel_room_desc": hotelRoomDesc,
        "hotel_price": hotelPrice,
        "no_room": noRoom,
        "no_adult": noAdult,
        "no_child": noChild,
      };
}
