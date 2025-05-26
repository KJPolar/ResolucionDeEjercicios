import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController _sueldoController = TextEditingController();

  double _ahorroSemanal = 0.0;
  double _ahorroAnual = 0.0;

  void calcularAhorro() {
    double sueldo = double.tryParse(_sueldoController.text) ?? 0.0;

    setState(() {
      _ahorroSemanal = sueldo * 0.15;
      _ahorroAnual = _ahorroSemanal * 4 * 12; // 4 semanas por mes, 12 meses
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 3: Ahorro Anual')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese el sueldo semanal:'),
            TextField(
              controller: _sueldoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 300.00',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularAhorro,
              child: const Text('Calcular Ahorro'),
            ),
            const SizedBox(height: 16),
            Text('Ahorro semanal (15%): \$${_ahorroSemanal.toStringAsFixed(2)}'),
            Text('Ahorro anual: \$${_ahorroAnual.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
