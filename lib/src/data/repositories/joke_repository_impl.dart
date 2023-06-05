import 'package:injectable/injectable.dart';

import '../../domain/models/joke.dart';
import '../../domain/repositories/joke_repository.dart';
import '../../utils/resources/resource.dart';
import '../datasources/remote/joke_api_service.dart';
import 'base/base_api_repository.dart';

@LazySingleton(as: JokeRepository)
class JokeRepositoryImpl extends BaseApiRepository implements JokeRepository {
  final JokeApiService _jokeApiService;

  JokeRepositoryImpl(this._jokeApiService);

  @override
  Future<Resource<Joke>> getJoke() {
    return getStateOf(response: _jokeApiService.getJoke);
  }
}
