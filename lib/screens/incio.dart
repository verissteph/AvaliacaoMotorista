import 'package:flutter/material.dart';
import '../models/motorista.dart';
import 'avaliacao.dart';
import 'historico.dart';

class TelaInicio extends StatelessWidget {
  final List<Motorista> motoristas = [
    Motorista(nome: "Lucas Aguiar", fotoUrl: "https://i.pinimg.com/564x/af/23/69/af2369811fac5b3bfa572bdaff6daaff.jpg"),
    Motorista(nome: "Joana Ferreira", fotoUrl: "https://i.pinimg.com/564x/95/dd/5f/95dd5fdf6bf3fbfead9e8217a49c0846.jpg"),
    Motorista(nome: "Carlos Teixeira", fotoUrl: "https://i.pinimg.com/564x/71/0e/f0/710ef05a3f915bf78e0efea9200d8aca.jpg"),
    Motorista(nome: "Fernanda Barbosa", fotoUrl: "https://i.pinimg.com/564x/d3/08/65/d30865a8e03c2878e361e441a26a74d1.jpg"),
    Motorista(nome: "Pedro Rocha", fotoUrl: "https://i.pinimg.com/564x/3f/97/4b/3f974b62c7d56a202eb5a7e33de7d3ed.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela inicial")),
      body: ListView.builder(
        itemCount: motoristas.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(motoristas[index].nome),
            trailing: IconButton(
              icon: Icon(Icons.rate_review),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => TelaAvaliacao(motorista: motoristas[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TelaHistorico()),
          );
        },
        child: Icon(Icons.history),
      ),
    );
  }

}
