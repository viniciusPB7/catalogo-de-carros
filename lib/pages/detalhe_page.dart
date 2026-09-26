import 'package:flutter/material.dart';

import '../models/carro.dart';

class DetalhePage extends StatelessWidget {
  final Carro carro;

  const DetalhePage({super.key, required this.carro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${carro.marca} ${carro.modelo}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Divider(height: 32),
                Text(
                  'Marca: ${carro.marca}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'Modelo: ${carro.modelo}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text('Ano: ${carro.ano}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text('Cor: ${carro.cor}', style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                Text(
                  'Status: ${carro.status}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
