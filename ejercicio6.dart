import 'package:flutter/material.dart';

class Ejercicio6 extends StatefulWidget {
  const Ejercicio6({super.key});

  @override
  State<Ejercicio6> createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final TextEditingController _examen1Controller = TextEditingController();
  final TextEditingController _examen2Controller = TextEditingController();
  final TextEditingController _examen3Controller = TextEditingController();

  double _promedio = 0.0;

  void calcularPromedio() {
    double examen1 = double.tryParse(_examen1Controller.text) ?? 0.0;
    double examen2 = double.tryParse(_examen2Controller.text) ?? 0.0;
    double examen3 = double.tryParse(_examen3Controller.text) ?? 0.0;

    setState(() {
      _promedio = (examen1 * 0.25) + (examen2 * 0.25) + (examen3 * 0.50);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 6: Promedio de Exámenes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese la nota del primer examen (25%):'),
            TextField(
              controller: _examen1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 8.5'),
            ),
            const SizedBox(height: 10),
            const Text('Ingrese la nota del segundo examen (25%):'),
            TextField(
              controller: _examen2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 7.0'),
            ),
            const SizedBox(height: 10),
            const Text('Ingrese la nota del tercer examen (50%):'),
            TextField(
              controller: _examen3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 9.0'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularPromedio,
              child: const Text('Calcular Promedio'),
            ),
            const SizedBox(height: 16),
            Text('Promedio final: ${_promedio.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
