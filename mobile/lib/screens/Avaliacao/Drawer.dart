import 'package:flutter/material.dart';
import 'package:mobile/constants.dart';
import 'package:mobile/screens/Avaliacao/Inicio.dart';
import 'package:mobile/screens/proposta/proposta_screen.dart';


import 'PostsPage.dart';

class Drawers extends StatelessWidget {
  Drawers({ListView listView});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              final destination = PostPage.routeName;
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
    );
  }
}
