import 'package:flutter/material.dart';
import '../models/carro.dart';

class FormularioPage extends StatefulWidget {
  final Carro? carroParaEditar;

  const FormularioPage({super.key, this.carroParaEditar});

  @override
  State<FormularioPage> createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _marcaController;
  late TextEditingController _modeloController;
  late TextEditingController _anoController;
  late TextEditingController _corController;
  String _status = 'Garagem';

  @override
  void initState() {
    super.initState();
    _marcaController = TextEditingController(text: widget.carroParaEditar?.marca ?? '');
    _modeloController = TextEditingController(text: widget.carroParaEditar?.modelo ?? '');
    _anoController = TextEditingController(text: widget.carroParaEditar?.ano.toString() ?? '');
    _corController = TextEditingController(text: widget.carroParaEditar?.cor ?? '');
    if (widget.carroParaEditar != null) {
      _status = widget.carroParaEditar!.status;
    }
  }

  @override
  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _anoController.dispose();
    _corController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final novoCarro = Carro(
        id: widget.carroParaEditar?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        marca: _marcaController.text.trim(),
        modelo: _modeloController.text.trim(),
        ano: int.parse(_anoController.text.trim()),
        cor: _corController.text.trim(),
        status: _status,
      );
      Navigator.of(context).pop(novoCarro);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.carroParaEditar != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Carro' : 'Novo Carro'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _marcaController,
                decoration: const InputDecoration(labelText: 'Marca'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a marca do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _modeloController,
                decoration: const InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o modelo do veículo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _anoController,
                decoration: const InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe o ano';
                  }
                  if (int.tryParse(value.trim()) == null) {
                    return 'Informe um ano válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _corController,
                decoration: const InputDecoration(labelText: 'Cor'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Informe a cor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _status,
                decoration: const InputDecoration(labelText: 'Status'),
                items: const [
                  DropdownMenuItem(value: 'Garagem', child: Text('Garagem')),
                  DropdownMenuItem(value: 'Desejado', child: Text('Desejado')),
                  DropdownMenuItem(value: 'Vendido', child: Text('Vendido')),
                ],
                onChanged: (val) {
                  if (val != null) setState(() => _status = val);
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Cancelar'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _salvar,
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}