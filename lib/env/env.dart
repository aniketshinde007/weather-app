import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.prod')
abstract class Env {
    @EnviedField(varName: 'openWeatherKey')
    static const String openWeatherKey = _Env.openWeatherKey;
}