import 'package:flutter/material.dart';
import 'package:mobile/components/card_list_item.dart';
import 'package:mobile/http/proposta_rest.dart';
import 'package:mobile/models/proposta.dart';

import '../detalhes_proposta_screen.dart';

class PropostaList extends StatelessWidget {
  const PropostaList({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    final PropostaRestClient _propostaRest = PropostaRestClient();

    return Container(
      //margin: EdgeInsets.only(bottom: defaultPadding * 2.5),
      height: size.height * 0.8,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: FutureBuilder<List<Proposta>>(
                initialData: List(),
                future: _propostaRest.findAll(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          children: <Widget>[
                            CircularProgressIndicator(),
                            Text('Carregando...')
                          ],
                        ),
                      );
                      break;
                    case ConnectionState.active:
                      break;
                    case ConnectionState.done:
                      final List<Proposta> propostas = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final proposta = propostas[index];
                          return _PropostaItem(proposta);
                        },
                        itemCount: propostas == null ? 0 : propostas.length,
                      );
                      break;
                  }
                  return Text('Falha ao listar propostas');
                }),
            //crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}

class _PropostaItem extends StatelessWidget {
  final Proposta _proposta;

  _PropostaItem(this._proposta);

  @override
  Widget build(BuildContext context) {
    return CardListItem(
      title: _proposta.nomeProjeto,
      subtitle: _proposta.instituicao.nome,
      press: () {
        Navigator.pushNamed(context, DetalhesPropostaScreen.routeName);
      },
    );
  }
}