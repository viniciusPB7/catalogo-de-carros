import 'package:flutter_test/flutter_test.dart';
import 'package:catalogo_de_carros/main.dart';

void main() {
  testWidgets(
    'Verifica se exibe o estado vazio quando a lista estiver sem itens',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MeuCatalogoApp());

      expect(find.text('Nenhum carro cadastrado'), findsOneWidget);
      expect(find.text('Cadastrar Carro'), findsOneWidget);
    },
  );
}
