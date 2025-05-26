import 'package:flutter/material.dart';

class Ejercicio7 extends StatefulWidget {
  const Ejercicio7({super.key});

  @override
  State<Ejercicio7> createState() => _Ejercicio7State();
}

class _Ejercicio7State extends State<Ejercicio7> {
  final TextEditingController _edadController = TextEditingController();

  int _meses = 0;
  int _semanas = 0;
  int _dias = 0;
  int _horas = 0;

  void calcularTiempoVivido() {
    int edad = int.tryParse(_edadController.text) ?? 0;

    setState(() {
      _meses = edad * 12;
      _semanas = edad * 52;
      _dias = edad * 365;
      _horas = _dias * 24;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 7: Tiempo Vivido')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese su edad en años:'),
            TextField(
              controller: _edadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 20'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularTiempoVivido,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 16),
            Text('Meses vividos: $_meses'),
            Text('Semanas vividas: $_semanas'),
            Text('Días vividos: $_dias'),
            Text('Horas vividas: $_horas'),
          ],
        ),
      ),
    );
  }
}
