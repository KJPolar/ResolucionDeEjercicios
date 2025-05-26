import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final TextEditingController _diasController = TextEditingController();
  final TextEditingController _hotelController = TextEditingController();
  final TextEditingController _comidaController = TextEditingController();

  double _totalHotel = 0.0;
  double _totalComida = 0.0;
  double _totalOtros = 0.0;
  double _totalCheque = 0.0;

  void calcularCheque() {
    int dias = int.tryParse(_diasController.text) ?? 0;
    double hotelPorDia = double.tryParse(_hotelController.text) ?? 0.0;
    double comidaPorDia = double.tryParse(_comidaController.text) ?? 0.0;

    setState(() {
      _totalHotel = hotelPorDia * dias;
      _totalComida = comidaPorDia * dias;
      _totalOtros = 100.0 * dias;
      _totalCheque = _totalHotel + _totalComida + _totalOtros;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 4: Monto de Cheque')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese los días de viaje:'),
            TextField(
              controller: _diasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 5'),
            ),
            const SizedBox(height: 10),
            const Text('Costo por día de hotel:'),
            TextField(
              controller: _hotelController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 200.00'),
            ),
            const SizedBox(height: 10),
            const Text('Costo por día de comida:'),
            TextField(
              controller: _comidaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ejemplo: 150.00'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularCheque,
              child: const Text('Calcular Monto'),
            ),
            const SizedBox(height: 16),
            Text('Total hotel: \$${_totalHotel.toStringAsFixed(2)}'),
            Text('Total comida: \$${_totalComida.toStringAsFixed(2)}'),
            Text('Total otros gastos (\$100 x día): \$${_totalOtros.toStringAsFixed(2)}'),
            const SizedBox(height: 8),
            Text(
              'Monto total del cheque: \$${_totalCheque.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
