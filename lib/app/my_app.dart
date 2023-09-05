import 'package:check_temperature/provider/weather_provider.dart';
import 'package:check_temperature/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xff1D3E50),
          textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
          )
        ),
        routes: {
          "/":(context) => const HomePage()
        },
      ),
    );
  }
}