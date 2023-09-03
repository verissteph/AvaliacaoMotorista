
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/avaliacao.dart';
import '../services/db_helper.dart';

class TelaHistorico extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Histórico de Avaliações"),
      ),
      body: FutureBuilder<List<Avaliacao>>(
        future: dbHelper.queryAllRows(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Avaliacao avaliacao = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          avaliacao.motorista.nome,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < avaliacao.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                            );
                          }),
                        ),
                        SizedBox(height: 10),
                        Text(avaliacao.comentario),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child:Text('Erro: ${snapshot.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
