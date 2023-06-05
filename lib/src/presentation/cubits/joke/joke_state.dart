part of 'joke_cubit.dart';

@freezed
class JokeState with _$JokeState {
  const factory JokeState.initial() = _Initial;
  const factory JokeState.loading() = _Loading;
  const factory JokeState.success(Joke joke) = _Success;
  const factory JokeState.failure(String message) = _Failure;
}
