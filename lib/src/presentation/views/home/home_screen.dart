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
          return Column(
            children: [
              Text(
                state.when(
                    initial: () => 'initial',
                    loading: () => 'loading',
                    success: (joke) => '$joke',
                    failure: (message) => message),
              ),
              ElevatedButton(
                onPressed: () async => cubit.getJoke(),
                child: const Text('Get Joke'),
              ),
            ],
          );
        },
      ),
    );
  }
}
