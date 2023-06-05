import '../../utils/resources/resource.dart';
import '../models/joke.dart';

abstract class JokeRepository {
  Future<Resource<Joke>> getJoke();
}
