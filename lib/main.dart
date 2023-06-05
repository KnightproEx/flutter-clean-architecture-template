import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/config/di/injection.dart';
import 'src/config/router/app_router.dart';
import 'src/config/themes/dark_theme.dart';
import 'src/config/themes/light_theme.dart';
import 'src/presentation/cubits/joke/joke_cubit.dart';
import 'src/utils/constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<JokeCubit>(
          create: (context) => getIt<JokeCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: appTitle,
        theme: lightTheme,
        darkTheme: darkTheme,
        routerConfig: _appRouter.config(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
