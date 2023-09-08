// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:check_temperature/provider/weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormSelectedName extends StatefulWidget {


  const FormSelectedName({
    Key? key,
  }) : super(key: key);

  @override
  State<FormSelectedName> createState() => _FormSelectedNameState();
}

class _FormSelectedNameState extends State<FormSelectedName> {

  final _formKey = GlobalKey<FormState>();
  late String name;

  void _changeNameRegion() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.save();

    Provider.of<WeatherProvider>(context, listen: false).getWeatherData(name);

    Navigator.pop(context);
  }
}

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text("Informe uma nova região!"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          initialValue: "Jaragua do sul",
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
            name = newValue!;
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