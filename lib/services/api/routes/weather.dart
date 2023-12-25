import 'package:dio/dio.dart';

import '../../../env/env.dart';

class WeatherRoute {
  final Dio dio;
  WeatherRoute(this.dio);

  Future<Response<dynamic>> getCurrentData(String lat, String lon) async {
    try {
      return await dio.get(
        '/data/2.5/weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': Env.openWeatherKey
        }
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> getForecastData(String lat, String lon) async {
    try {
      return await dio.get(
        '/data/2.5/forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'appid': Env.openWeatherKey
        }
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> getCitiesData(String city) async {
    try {
      return await dio.get(
        '/geo/1.0/direct',
        queryParameters: {
          'q': city,
          'limit': 5,
          'appid': Env.openWeatherKey
        }
      );
    } catch (e) {
      rethrow;
    }
  }

}
