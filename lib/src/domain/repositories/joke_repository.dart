import '../../utils/resources/resource.dart';
import '../models/joke.dart';

mixin JokeRepository {
  Future<Resource<Joke>> getJoke();
}
