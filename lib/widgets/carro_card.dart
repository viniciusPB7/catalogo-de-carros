import 'package:flutter/material.dart';

import '../models/carro.dart';

class CarroCard extends StatelessWidget {
  final Carro carro;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CarroCard({
    super.key,
    required this.carro,
    required this.onTap,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.directions_car, color: Colors.white),
        ),
        title: Text(
          '${carro.marca} ${carro.modelo}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Ano: ${carro.ano} | Cor: ${carro.cor}\nStatus: ${carro.status}',
        ),
        isThreeLine: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              tooltip: 'Editar Carro',
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              tooltip: 'Excluir Carro',
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
