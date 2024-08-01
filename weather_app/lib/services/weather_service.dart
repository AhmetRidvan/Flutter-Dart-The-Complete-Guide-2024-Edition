import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Future<String> _getLocation() async {
    final serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      Future.error("Konum servisiniz kapalı");
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Future.error("Konum izni vermelisiniz");
      }
    }

    final Position location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    List<Placemark> placeMark =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    String city;

    city = placeMark[0].administrativeArea! ?? "hata";
    return city;
  }

  Future<List<WeatherModel>> getWeatherData() async {
    final city = await _getLocation();
    String _url =
        'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=$city';
    Map<String, dynamic> _headers = {
      'authorization': 'apikey 5mBKmmYx6VvE45MlHuDC1l:2w1irOoOjWDvokyTlgX0Tf',
      'content-type': 'application/json'
    };

    final dio = Dio();

    final response = await dio.get(_url, options: Options(headers: _headers));

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      Future.error("Hata");
    }
    final List cevap = response.data["result"];

    final List<WeatherModel> modelListesi = cevap
        .map(
          (e) => WeatherModel.fromJson(e),
        )
        .toList();
    return modelListesi;
  }
}
