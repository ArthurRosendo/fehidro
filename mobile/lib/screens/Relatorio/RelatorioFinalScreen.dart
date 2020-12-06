import 'package:flutter/material.dart';

import 'TabelaRelatorio.dart';

class RelatorioFinalScreen extends StatelessWidget {

  static String routeName = "/relatorioFinal";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Relatório Final',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabelaRelatorio(title: 'Relatório Final'),
    );
  }
}


