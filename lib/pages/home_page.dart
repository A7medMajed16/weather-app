// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/Widgets/failure_widget.dart';
import 'package:wheather_app/Widgets/initial_widget.dart';
import 'package:wheather_app/Widgets/success_widget.dart';
import 'package:wheather_app/cubits/cubit/weather_cubit.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:wheather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, this.weatherData});

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search),
            ),
          ],
          title: const Text('Weather App'),
        ),
        body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (buildContext, state) {
          if (state is WeatherLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherSuccess) {
            weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel;
            return SuccessWidget(weatherData: weatherData);
          } else if (state is WeatherFailure) {
            return const FailureWidget();
          } else {
            return const InitialWidget();
          }
        }));
  }
}
