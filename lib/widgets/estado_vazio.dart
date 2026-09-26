import 'package:flutter/material.dart';

class EstadoVazio extends StatelessWidget {
  final VoidCallback action;

  const EstadoVazio({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_car_outlined, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Nenhum carro cadastrado',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              'Adicione um novo veículo para começar a sua coleção.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: action,
              icon: const Icon(Icons.add),
              label: const Text('Cadastrar Carro'),
            ),
          ],
        ),
      ),
    );
  }
}