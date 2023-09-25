import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/joke/joke_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<JokeCubit>(context);
    return Scaffold(
      body: BlocBuilder<JokeCubit, JokeState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: [
                state.when(
                  initial: () => const Text('initial'),
                  loading: () => const LinearProgressIndicator(),
                  success: (joke) => Text('$joke'),
                  failure: Text.new,
                ),
                ElevatedButton(
                  onPressed: () async => cubit.getJoke(),
                  child: const Text('Get Joke'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
