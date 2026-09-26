import 'package:flutter/material.dart';
import '../models/carro.dart';
import '../widgets/carro_card.dart';
import '../widgets/estado_vazio.dart';
import 'detalhe_page.dart';
import 'formulario_page.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final List<Carro> _carros = [];

  void _abrirFormulario([Carro? carro]) async {
    final resultado = await Navigator.of(context).push<Carro>(
      MaterialPageRoute(
        builder: (_) => FormularioPage(carroParaEditar: carro),
      ),
    );

    if (resultado != null) {
      setState(() {
        final index = _carros.indexWhere((c) => c.id == resultado.id);
        if (index >= 0) {
          _carros[index] = resultado;
        } else {
          _carros.add(resultado);
        }
      });
    }
  }

  void _excluirCarro(String id) {
    setState(() {
      _carros.removeWhere((c) => c.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de Carros'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (_carros.isEmpty) {
            return EstadoVazio(action: () => _abrirFormulario());
          }

          final isWideScreen = constraints.maxWidth > 600;

          if (isWideScreen) {
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.5,
              ),
              itemCount: _carros.length,
              itemBuilder: (context, index) {
                final carro = _carros[index];
                return CarroCard(
                  carro: carro,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DetalhePage(carro: carro)),
                  ),
                  onEdit: () => _abrirFormulario(carro),
                  onDelete: () => _excluirCarro(carro.id),
                );
              },
            );
          }

          return ListView.builder(
            itemCount: _carros.length,
            itemBuilder: (context, index) {
              final carro = _carros[index];
              return CarroCard(
                carro: carro,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetalhePage(carro: carro)),
                ),
                onEdit: () => _abrirFormulario(carro),
                onDelete: () => _excluirCarro(carro.id),
              );
            },
          );
        },
      ),
      floatingActionButton: _carros.isNotEmpty
          ? FloatingActionButton(
              onPressed: () => _abrirFormulario(),
              tooltip: 'Adicionar Carro',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}