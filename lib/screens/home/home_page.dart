import 'package:check_temperature/screens/home/components/show_temperature.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D3E50),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text("Verificar temperatura"),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [
            ShowTemperature()
          ],
        ),
      ),
    );
  }
}