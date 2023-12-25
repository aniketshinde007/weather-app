import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/api/api.dart';
import '../../models/day_weather.dart';

part 'provider.g.dart';

@riverpod
Future<HomeData> homeData(HomeDataRef ref) async {
  final currentResponse = await ref.read(apiProvider).weatherRoute.getCurrentData('19.85', '74');
  final forecastResponse = await ref.read(apiProvider).weatherRoute.getForecastData('19.85', '74');
  var dayWeather = DayWeather.fromJson(currentResponse.data);
  var forecasts = forecastResponse.data['list'].map<DayWeather>((e) => DayWeather.fromJson(e)).toList();
  var history = forecastResponse.data['list'].map<DayWeather>((e) => DayWeather.fromJson(e)).toList();
  return HomeData(dayWeather: dayWeather, forecasts: forecasts, history: history);
}

class HomeData {
  final DayWeather dayWeather;
  final List<DayWeather> forecasts;
  final List<DayWeather> history;
  HomeData({required this.dayWeather, required this.forecasts, required this.history,});
}