import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile/screens/Avaliacao/AvaliacaoPage2.dart';
import 'package:mobile/screens/Avaliacao/Inicio.dart';
import 'package:mobile/screens/Avaliacao/PostsPage.dart';
import 'package:mobile/screens/proposta/proposta_screen.dart';

import '../constants.dart';

class BaseComponent extends StatelessWidget {
  BaseComponent({
    Key key,
    @required this.body,
  }) : super(key: key);

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'Bem-vindo(a) ao\n Portal CBH-BS!',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
              ),
            ),
            ListTile(
              title: Text('Propostas'),
              onTap: () {
                final destination = PropostaScreen.routeName;
                bool isDestinationSameAsCurrent = false;

                Navigator.popUntil(context, (route) {
                  if (route.settings.name == destination) {
                    isDestinationSameAsCurrent = true;
                  }
                  return true;
                });

                if (!isDestinationSameAsCurrent) {
                  Navigator.pushNamed(context, destination);
                }
              },
            ),
            ListTile(
              title: Text('Avaliações'),
              onTap: () {
              //  final destination = PostPage.routeName;
                final destination = AvaliacaoPage.routeName;
                bool isDestinationSameAsCurrent = false;

                Navigator.popUntil(context, (route) {
                  if (route.settings.name == destination) {
                    isDestinationSameAsCurrent = true;
                  }
                  return true;
                });

                if (!isDestinationSameAsCurrent) {
                  Navigator.pushNamed(context, destination);
                }

              },
            ),
            ListTile(
              title: Text('Relatório'),
              onTap: () {
                final destination = Inicio.routeName;
                bool isDestinationSameAsCurrent = false;

                Navigator.popUntil(context, (route) {
                  if (route.settings.name == destination) {
                    isDestinationSameAsCurrent = true;
                  }
                  return true;
                });

                if (!isDestinationSameAsCurrent) {
                  Navigator.pushNamed(context, destination);
                }

              },
            )
          ],
        ),
      ),
    );
  }
}
