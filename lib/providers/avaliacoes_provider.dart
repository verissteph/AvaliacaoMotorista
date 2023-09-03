import '../models/avaliacao.dart';
import '../models/motorista.dart';
import '../services/db_helper.dart';
import 'package:flutter/foundation.dart';

class AvaliacoesProvider with ChangeNotifier {
  List<Avaliacao> _avaliacoes = [];

  List<Avaliacao> get avaliacoes => [..._avaliacoes];

  void addAvaliacao(Avaliacao avaliacao) async {
    int id = await DatabaseHelper.instance.insert(avaliacao);

    if (id != -1) {
      print("Avaliação inserida com sucesso com o ID $id.");
      _avaliacoes.add(avaliacao);
      notifyListeners();
    } else {
      print("Erro ao inserir avaliação no banco de dados.");
    }
  }


  Future<void> fetchAvaliacoes() async {
    final dataList = await DatabaseHelper.instance.queryAllRows();
    _avaliacoes = dataList.map(
          (item) => Avaliacao(
        motorista: Motorista(nome: item.motorista.nome, fotoUrl: item.motorista.fotoUrl),
        rating:item.rating,
        comentario: item.comentario,
      ),
    ).toList();
    notifyListeners();
  }
}
