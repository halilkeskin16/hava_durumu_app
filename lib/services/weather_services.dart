import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_durumu_app/models/weather_models.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherServices {
  Future<String> getLocation() async {
    // Konum servisinin durumunu kontrol
    final bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Konum servisiniz kapalı.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Konum erişiminize lütfen izin veriniz.");
      }
    }
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    final List<Placemark> placemarkt =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarkt[0].administrativeArea ?? "";
  }

  Future getWeatherData() async {
    final String city = await getLocation();
    final String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
    final String apiKey =
        dotenv.env['API_KEY']!;
    final Map<String, dynamic> header = {
      'authorization': 'apikey $apiKey',
      'content-type': 'application/json'
    };
    final dio = Dio();
    final response = await dio.get(url, options: Options(headers: header));
    if (response.statusCode != 200) Future.error("Bir hata oluştu");

    final List list = response.data['result'];
    final List<WeatherModels> weatherList =
        list.map((e) => WeatherModels.fromJson(e)).toList();
    return weatherList;
  }
}
