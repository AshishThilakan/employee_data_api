// To parse this JSON data, do
//
//     final getMethodModel = getMethodModelFromJson(jsonString);

import 'dart:convert';

List<GetMethodModel> getMethodModelFromJson(String str) =>
    List<GetMethodModel>.from(
        json.decode(str).map((x) => GetMethodModel.fromJson(x)));

String getMethodModelToJson(List<GetMethodModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetMethodModel {
  String? id;
  String? name;
  String? dob;
  String? phone;
  String? city;
  String? email;
  String? address;
  String? jobrole;
  String? gender;
  String? photo;
  String? tdate;
  String? ttime;

  GetMethodModel({
    this.id,
    this.name,
    this.dob,
    this.phone,
    this.city,
    this.email,
    this.address,
    this.jobrole,
    this.gender,
    this.photo,
    this.tdate,
    this.ttime,
  });

  factory GetMethodModel.fromJson(Map<String, dynamic> json) => GetMethodModel(
    id: json["id"],
    name: json["name"],
    dob: json["dob"],
    phone: json["phone"],
    city: json["city"],
    email: json["email"],
    address: json["address"],
    jobrole: json["jobrole"],
    gender: json["gender"],
    photo: json["photo"],
    tdate: json["tdate"],
    ttime: json["ttime"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "dob": dob,
    "phone": phone,
    "city": city,
    "email": email,
    "address": address,
    "jobrole": jobrole,
    "gender": gender,
    "photo": photo,
    "tdate": tdate,
    "ttime": ttime,
  };
}