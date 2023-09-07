// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:check_temperature/screens/home/components/form_selected_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:check_temperature/provider/weather_provider.dart';

class ShowTemperature extends StatefulWidget {

  final String newName;

  const ShowTemperature({
    Key? key,
    required this.newName,
  }) : super(key: key);

  @override
  State<ShowTemperature> createState() => _ShowTemperatureState();
}

class _ShowTemperatureState extends State<ShowTemperature> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<WeatherProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(widget.newName),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context, 
                        builder: (context) {
                          return const FormSelectedName();
                        },
                      );
                    }, 
                    icon: const Icon(Icons.edit, color: Colors.white)
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  provider.getWeatherData(widget.newName);
                }, 
                icon: const Icon(Icons.refresh, color: Colors.white)
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Column(
              children: [
                const Text("30.0\u2103",
                  style: TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Chuva fraca com trovões", style: TextStyle(
                    fontSize: 12
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/tempestade.png"),
                    const Text("Tempestade")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}