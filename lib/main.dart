import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wheather_app/cubits/cubit/weather_cubit.dart';

import 'package:wheather_app/pages/home_page.dart';

import 'package:wheather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => WeatherCubit(WeatherService()),
    child: const WeatherApp(),
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      home: HomePage(),
    );
  }
}