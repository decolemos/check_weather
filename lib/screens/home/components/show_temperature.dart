import 'package:check_temperature/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowTemperature extends StatelessWidget {
  const ShowTemperature({super.key});

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
                  const Text("Jaragua do Sul, SC"),
                  IconButton(
                    onPressed: () {
                      
                    }, 
                    icon: const Icon(Icons.edit, color: Colors.white)
                  )
                ],
              ),
              IconButton(
                onPressed: () {
                  provider.getTemperature();
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