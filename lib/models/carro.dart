class Carro {
  final String id;
  final String marca;
  final String modelo;
  final int ano;
  final String cor;
  final String status; // Ex: "Garagem", "Desejado", "Vendido"

  Carro({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.status,
  });

  Carro copyWith({
    String? id,
    String? marca,
    String? modelo,
    int? ano,
    String? cor,
    String? status,
  }) {
    return Carro(
      id: id ?? this.id,
      marca: marca ?? this.marca,
      modelo: modelo ?? this.modelo,
      ano: ano ?? this.ano,
      cor: cor ?? this.cor,
      status: status ?? this.status,
    );
  }
}
