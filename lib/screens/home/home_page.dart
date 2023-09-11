import 'package:check_temperature/screens/home/components/show_temperature.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D3E50),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1.0,
        title: const Text("Verificar Clima"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              ShowTemperature()
            ],
          ),
        ),
      ),
    );
  }
}