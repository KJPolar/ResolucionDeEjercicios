import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final TextEditingController _precioController = TextEditingController();

  double _precioConDescuento = 0.0;
  double _precioFinal = 0.0;

  void calcularPrecioFinal() {
    double precio = double.tryParse(_precioController.text) ?? 0.0;

    setState(() {
      _precioConDescuento = precio * 0.80; // 20% de descuento
      _precioFinal = _precioConDescuento * 1.15; // 15% de IVA
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicio 2: Descuento + IVA')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ingrese el precio del artículo:'),
            TextField(
              controller: _precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Ejemplo: 100.00',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularPrecioFinal,
              child: const Text('Calcular'),
            ),
            const SizedBox(height: 16),
            Text('Precio con descuento (20%): \$${_precioConDescuento.toStringAsFixed(2)}'),
            Text('Precio final con IVA (15%): \$${_precioFinal.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
