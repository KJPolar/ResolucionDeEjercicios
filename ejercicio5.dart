import 'package:flutter/material.dart';

class Ejercicio5 extends StatefulWidget {
  const Ejercicio5({super.key});

  @override
  State<Ejercicio5> createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  final TextEditingController _ladoController = TextEditingController();

  double _area = 0.0;

  void calcularArea() {
    double lado = double.tryParse(_ladoController.text) ?? 0.0;

    setState(() {
      _area = lado * lado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 5: Área de un Cuadrado')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese la longitud del lado del cuadrado:'),
            TextField(
              controller: _ladoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 5'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularArea,
              child: const Text('Calcular Área'),
            ),
            const SizedBox(height: 16),
            Text('Área del cuadrado: $_area'),
          ],
        ),
      ),
    );
  }
}
