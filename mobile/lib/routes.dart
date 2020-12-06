import 'package:flutter/cupertino.dart';
import 'package:mobile/screens/Avaliacao/AvaliacaoPage2.dart';
import 'package:mobile/screens/Avaliacao/Inicio.dart';
import 'package:mobile/screens/Avaliacao/PostsPage.dart';
import 'package:mobile/screens/Relatorio/RelatorioFinalScreen.dart';
import 'package:mobile/screens/login/login_screen.dart';
import 'package:mobile/screens/proposta/detalhes_proposta_screen.dart';
import 'package:mobile/screens/proposta/proposta_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  PropostaScreen.routeName: (context) => PropostaScreen(),
  DetalhesPropostaScreen.routeName: (context) => DetalhesPropostaScreen(),
  PostPage.routeName: (context) => PostPage(),
  RelatorioFinalScreen.routeName: (context) => RelatorioFinalScreen(),
  Inicio.routeName: (context) => Inicio(),
  AvaliacaoPage.routeName: (context) => AvaliacaoPage(),
};