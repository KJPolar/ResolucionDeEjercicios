import 'main.dart';
import 'package:flutter/material.dart';


class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});

  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final TextEditingController _kwController = TextEditingController();
  double _totalPagar = 0.0;

  void calcularPago() {
    double kw = double.tryParse(_kwController.text) ?? 0.0;
    double precioPorKW = 0.50; // Puedes cambiar el valor si te lo dan
    setState(() {
      _totalPagar = kw * precioPorKW;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 1: Pago de luz')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Ingrese el consumo en Kilowatts (KW):'),
            TextField(
              controller: _kwController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 100',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularPago,
              child: const Text('Calcular Pago'),
            ),
            const SizedBox(height: 16),
            Text('Total a pagar: \$$_totalPagar'),
          ],
        ),
      ),
    );
  }
}
