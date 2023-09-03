import 'package:avaliacao/providers/avaliacoes_provider.dart';
import 'package:avaliacao/screens/incio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() => {
sqfliteFfiInit(),
runApp(MyApp())
};

  DatabaseFactory databaseFactory = databaseFactoryFfi;
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AvaliacoesProvider(),
      child: MaterialApp(
        title: 'App de Avaliação de Motorista',
        home: TelaInicio(),
      ),
    );
  }
}
