import 'dart:convert';

class WeatherModels {
  final String tarih;
  final String ikon;
  final String durum;
  final String derece;
  final String min;
  final String max;
  final String gece;
  final String nem;
  final String gun;

  WeatherModels({
    required this.tarih,
    required this.gun,
    required this.ikon,
    required this.durum,
    required this.derece,
    required this.min,
    required this.max,
    required this.gece,
    required this.nem,
  });

  WeatherModels.fromJson(Map<String, dynamic> json)
      : ikon = json['icon'],
        durum = json['description'],
        derece = json['degree'],
        min = json['min'],
        max = json['max'],
        gece = json['night'],
        nem = json['humidity'],
        gun = json['day'],
        tarih = json['date'];
}
