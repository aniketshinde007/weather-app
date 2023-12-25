import 'package:dio/dio.dart';

import '../../../env/env.dart';

class WeatherRoute {
  final Dio dio;
  WeatherRoute(this.dio);

  /// Get current weather data.
  ///
  /// [lat] - latitude of the location.
  /// [lon] - longitude of the location.
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

  /// Get weather forecast of the next 5 days.
  ///
  /// [lat] - latitude of the location.
  /// [lon] - longitude of the location.
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

}
