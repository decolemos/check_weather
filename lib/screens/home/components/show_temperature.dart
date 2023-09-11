// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_temperature/provider/weather_provider.dart';
import 'package:check_temperature/screens/home/components/form_selected_name.dart';

class ShowTemperature extends StatefulWidget {

  const ShowTemperature({
    Key? key,
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
                  provider.weatherData == null
                  ? const Center(
                    child: Text("Nenhuma região selecionada!"),
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${provider.weatherData!.name} - ${provider.weatherData!.region}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(provider.weatherData!.localTime,
                        style: const TextStyle(
                          fontSize: 12
                        ),
                      )
                    ],
                  ),
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
                  if(provider.weatherData == null){
                    final snackBar = SnackBar(
                      content: const Text("Sem região selecionada"),
                      action: SnackBarAction(
                        label: "Cancelar", 
                        onPressed: () {
                          
                        },),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    provider.getWeatherData(provider.weatherData!.name);
                  }
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
                provider.weatherData == null
                ? const Text("Sem informação")
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Image.network(provider.weatherData!.iconCondition,
                        fit: BoxFit.fill,
                      )
                    ),
                    Text(provider.weatherData!.condition)
                  ],
                ),
                provider.weatherData == null
                ? const Text("- -",
                  style: TextStyle(fontSize: 50),
                )
                : Text("${provider.weatherData!.tempC}\u2103",
                  style: const TextStyle(fontSize: 50),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    provider.weatherData == null
                    ? const Text("Umidade: -  -",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    : Text("Umidade: ${provider.weatherData!.humidity} %",
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    provider.weatherData == null
                    ? const Text("Vento: -  -",
                        style: TextStyle(
                          fontSize: 20
                        ),
                      )
                    : Text("Vento: ${provider.weatherData!.windDegree} mph",
                      style: const TextStyle(
                        fontSize: 20
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}