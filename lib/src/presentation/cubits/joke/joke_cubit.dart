import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/models/joke.dart';
import '../../../domain/repositories/joke_repository.dart';

part 'joke_cubit.freezed.dart';
part 'joke_state.dart';

@injectable
class JokeCubit extends Cubit<JokeState> {
  final JokeRepository _jokeRepository;

  JokeCubit(this._jokeRepository) : super(const JokeState.initial());

  Future<void> getJoke() async {
    emit(const JokeState.loading());
    final response = await _jokeRepository.getJoke();
    response.when(
      success: (joke) => emit(JokeState.success(joke)),
      failure: (error) => emit(
          JokeState.failure(error.message ?? 'An unexpected error occurred')),
    );
  }
}
