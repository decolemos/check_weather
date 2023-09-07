import 'package:check_temperature/provider/weather_provider.dart';
import 'package:check_temperature/screens/home/components/show_temperature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSelectedName extends StatefulWidget {
  const FormSelectedName({super.key});

  @override
  State<FormSelectedName> createState() => _FormSelectedNameState();
}

class _FormSelectedNameState extends State<FormSelectedName> {

  final _formKey = GlobalKey<FormState>();
  late String newName;

  Future<void> _changeNameRegion() async {
    if(!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final weatherData = await Provider.of<WeatherProvider>(context, listen: false).getWeatherData(newName);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text("Informe uma nova região!"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.white, width: 2.0)
            ),
            hintStyle: TextStyle(color: Colors.grey),
            hintText: "Informar cidade, estado ou país"
          ),
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "O campo não pode ser vazio";
            } else if(value.length < 2) {
              return "Deve conter mais de 2 caracteres!";
            }
            return null;
          },
          onSaved: (newValue) {
            newName = newValue!;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            _changeNameRegion();
          }, 
          child: const Text("Confirmar")
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
          child: const Text("Cancelar")
        )
      ],
    );
  }
}