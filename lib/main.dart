import 'package:flutter/material.dart';

import 'pages/lista_page.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MeuCatalogoApp());
}

class MeuCatalogoApp extends StatelessWidget {
  const MeuCatalogoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Carros',
      theme: AppTheme.lightTheme,
      home: const ListaPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
