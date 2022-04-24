import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PrefModel {
  static PrefModel instance = PrefModel._internal();


  PrefModel.normal({
    this.token,
    this.role,
    this.lat,
    this.lng,

  });

  PrefModel._internal() {
    // initialization logic
  }
  String? token;
  String? role;
  double? lat;
  double? lng;


  void loadData(SharedPreferences preferences){
    final jsonString = preferences.getString("model") ?? "{}";
    PrefModel.instance = PrefModel.fromJson(json.decode(jsonString));
  }

  void saveData(SharedPreferences preferences){
    final jsonString = json.encode(toJson());
    preferences.setString("model", jsonString);
  }

  factory PrefModel.fromJson(Map<String,dynamic> json) => PrefModel.normal(
    token: json['token'] != null ? json['token'] as String : null,
    role: json['role'] != null ? json['role'] as String : null,
    lat: json['lat'] != null ? json['lat'] as double : null,
    lng: json['lng'] != null ? json['lng'] as double : null,
  );

  Map<String, dynamic> toJson() => {
    'token': token,
    'role': role,
    'lat': lat,
    'lng': lng,
  };


}
