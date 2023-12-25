import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/api/routes/weather.dart';

final apiProvider = Provider<APIService>((ref) => APIService(ref: ref));

class APIService {
  final Ref ref;

  APIService({required this.ref});

  Dio get dio => createDio();
  Dio get externalDio => createDio(isExternal: true);

  String get serverUrl => 'https://api.openweathermap.org';

  Dio createDio({bool isExternal = false}) {
    var dio = Dio(BaseOptions(
      baseUrl: isExternal ? '' : serverUrl,
    ));
    return dio;
  }

  WeatherRoute get weatherRoute => WeatherRoute(dio);

}