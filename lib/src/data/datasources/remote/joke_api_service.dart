import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../domain/models/joke.dart';
import '../../../utils/constants/strings.dart';

part 'joke_api_service.g.dart';

@injectable
@RestApi(baseUrl: jokeApiUrl, parser: Parser.FlutterCompute)
abstract class JokeApiService {
  @factoryMethod
  factory JokeApiService(Dio dio) = _JokeApiService;

  @GET('/random_joke')
  Future<HttpResponse<Joke>> getJoke();
}

Joke deserializeJoke(Map<String, dynamic> json) => Joke.fromJson(json);
