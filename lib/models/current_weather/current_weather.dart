// To parse this JSON data, do
//
//     final currentWeather = currentWeatherFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'current_weather.freezed.dart';
part 'current_weather.g.dart';

CurrentWeather currentWeatherFromJson(String str) => CurrentWeather.fromJson(json.decode(str));

String currentWeatherToJson(CurrentWeather data) => json.encode(data.toJson());

@freezed
class CurrentWeather with _$CurrentWeather {
    const factory CurrentWeather({
        @JsonKey(name: "coord")
        required Coord coord,
        @JsonKey(name: "weather")
        required List<Weather> weather,
        @JsonKey(name: "base")
        required String base,
        @JsonKey(name: "main")
        required Main main,
        @JsonKey(name: "visibility")
        required int visibility,
        @JsonKey(name: "wind")
        required Wind wind,
        @JsonKey(name: "rain")
        required Rain rain,
        @JsonKey(name: "clouds")
        required Clouds clouds,
        @JsonKey(name: "dt")
        required int dt,
        @JsonKey(name: "sys")
        required Sys sys,
        @JsonKey(name: "timezone")
        required int timezone,
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "cod")
        required int cod,
    }) = _CurrentWeather;

    factory CurrentWeather.fromJson(Map<String, dynamic> json) => _$CurrentWeatherFromJson(json);
}

@freezed
class Clouds with _$Clouds {
    const factory Clouds({
        @JsonKey(name: "all")
        required int all,
    }) = _Clouds;

    factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);
}

@freezed
class Coord with _$Coord {
    const factory Coord({
        @JsonKey(name: "lon")
        required double lon,
        @JsonKey(name: "lat")
        required double lat,
    }) = _Coord;

    factory Coord.fromJson(Map<String, dynamic> json) => _$CoordFromJson(json);
}

@freezed
class Main with _$Main {
    const factory Main({
        @JsonKey(name: "temp")
        required double temp,
        @JsonKey(name: "feels_like")
        required double feelsLike,
        @JsonKey(name: "temp_min")
        required double tempMin,
        @JsonKey(name: "temp_max")
        required double tempMax,
        @JsonKey(name: "pressure")
        required int pressure,
        @JsonKey(name: "humidity")
        required int humidity,
        @JsonKey(name: "sea_level")
        required int seaLevel,
        @JsonKey(name: "grnd_level")
        required int grndLevel,
    }) = _Main;

    factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Rain with _$Rain {
    const factory Rain({
        @JsonKey(name: "1h")
        required double the1H,
    }) = _Rain;

    factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);
}

@freezed
class Sys with _$Sys {
    const factory Sys({
        @JsonKey(name: "type")
        required int type,
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "country")
        required String country,
        @JsonKey(name: "sunrise")
        required int sunrise,
        @JsonKey(name: "sunset")
        required int sunset,
    }) = _Sys;

    factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

@freezed
class Weather with _$Weather {
    const factory Weather({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "main")
        required String main,
        @JsonKey(name: "description")
        required String description,
        @JsonKey(name: "icon")
        required String icon,
    }) = _Weather;

    factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind {
    const factory Wind({
        @JsonKey(name: "speed")
        required double speed,
        @JsonKey(name: "deg")
        required int deg,
        @JsonKey(name: "gust")
        required double gust,
    }) = _Wind;

    factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}
