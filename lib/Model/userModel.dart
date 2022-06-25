import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String nik;
  String nama;
  String password;

  User({required this.nik, required this.nama, required this.password});

  Map<String, dynamic> toJson() =>
      {'NIK': nik, 'NAMA': nama, 'PASSWORD': password};

  static User fromJson(Map<String, dynamic> json) =>
      User(nik: json['NIK'], nama: json['NAMA'], password: json['PASSWORD']);
}