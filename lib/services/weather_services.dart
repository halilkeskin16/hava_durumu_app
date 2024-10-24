import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hava_durumu_app/models/weather_models.dart';

class WeatherServices {
  Future<String> getLocation() async {
    //Konum servisinin durumunu kontrol.
    final bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      return Future.error('Konum servisiniz kapalı.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    //Konum izinini kontrol
    if (permission == LocationPermission.denied) {
      //İzin verilmezse tekrar izin isteme.
      permission = await Geolocator.requestPermission();
      //Tekrar izin vermezse hata mesajı
      if (permission == LocationPermission.denied) {
        return Future.error("Konum erişiminize lütfen izin veriniz.");
      }
    }
    //Konumunu yüksek doğrulukta alma
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    //Haritada konum işaretleme yapılması
    final List<Placemark> placemarkt =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    return placemarkt[0].administrativeArea ?? "";
  }

  Future getWeatherData() async {
    //Şehir bilgisini diğer fonksiyondan alıyoruz.
    final String city = await getLocation();
    //Apiye bağlantı işlemleri
    final String url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
    const Map<String, dynamic> header = {
      'authorization': 'apikey 5VCNO6MSDXBa7mpOsiHrDV:6bqRYTF7cKcmdTSPwak3Xl',
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
