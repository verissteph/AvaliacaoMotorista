import 'package:flutter/material.dart';
import '../models/avaliacao.dart';
import '../models/motorista.dart';
import '../providers/avaliacoes_provider.dart';
import 'package:provider/provider.dart';



class TelaAvaliacao extends StatefulWidget {
  final Motorista motorista;

  TelaAvaliacao({required this.motorista});

  @override
  _TelaAvaliacaoState createState() => _TelaAvaliacaoState();
}

class _TelaAvaliacaoState extends State<TelaAvaliacao> {
  double _rating = 0;
  final TextEditingController _comentarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliação do Motorista"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.motorista.fotoUrl),
              SizedBox(height: 20),
              Text(widget.motorista.nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1.0;
                      });
                    },
                  );
                }),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _comentarioController,
                decoration: InputDecoration(labelText: "Comentário"),
                maxLines: 4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Provider.of<AvaliacoesProvider>(context, listen: false).addAvaliacao(
                    Avaliacao(
                      motorista: widget.motorista,
                      rating: _rating,
                      comentario: _comentarioController.text,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text("Enviar Avaliação"),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
