import 'motorista.dart';

class Avaliacao {
  final Motorista motorista;
  final double rating;
  final String comentario;

  Avaliacao({
    required this.motorista,
    required this.rating,
    required this.comentario,
  });

  Map<String, dynamic> toMap() {
    return {
      'nomeMotorista': this.motorista.nome,
      'fotoUrlMotorista': this.motorista.fotoUrl,
      'rating': this.rating,
      'comentario': this.comentario,
    };
  }

  factory Avaliacao.fromMap(Map<String, dynamic> map) {
    return Avaliacao(
      motorista: Motorista(
        nome: map['nomeMotorista'],
        fotoUrl: map['fotoUrlMotorista'],
      ),
      rating: map['rating'],
      comentario: map['comentario'],
    );
  }
}
