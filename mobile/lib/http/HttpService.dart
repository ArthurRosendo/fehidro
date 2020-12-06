import 'dart:convert';

import 'package:http/http.dart';
import 'package:mobile/models/Usuario.dart';
import 'package:mobile/models/avaliacao.dart';
import 'package:mobile/models/subpdc.dart';


class HttpService {
  final String urlAvaliacao = "https://portalcbhbs-api.herokuapp.com/avaliacao";
  final String urlRelatorio = "https://portalcbhbs-api.herokuapp.com/relatorio/final";
  final String urlSubpdc1 = "https://portalcbhbs-api.herokuapp.com/relatorio/subPdc/1";
  final String urlSubpdc2 = "https://portalcbhbs-api.herokuapp.com/relatorio/subPdc/2";
  final String urlRelatorioSubPdc = "https://portalcbhbs-api.herokuapp.com/subpdc";
  final String urlgetUserId = "https://portalcbhbs-api.herokuapp.com/usuario/obterPorLogin/";
  final String urlAvaliacaoID = "https://portalcbhbs-api.herokuapp.com/avaliacao/listarAvaliador/";

  //"https://jsonplaceholder.typicode.com/posts";
  Future<List<Avaliacao>> getPosts() async {
    Response res = await get(urlAvaliacao);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Avaliacao> posts =
      body.map((dynamic item) => Avaliacao.fromJson(item)).toList();

      return posts;
    } else {
      throw "Cant get posts.";
    }
  }

  Future<List<Avaliacao>> getPostsId(String UserId) async {
    Response res = await get(urlAvaliacaoID+UserId);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Avaliacao> posts =
      body.map((dynamic item) => Avaliacao.fromJson(item)).toList();

      return posts;
    } else {
      throw "Cant get posts.";
    }
  }

  Future getUserId(String idUser) async {
    Response res = await get(urlgetUserId+idUser);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);



      return body;
    } else {
      throw "Cant get posts.";
    }
  }

  Future<Map<String, dynamic>> getFinal() async {
    Response res = await get(urlRelatorio);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
      print("resultado :" + body["itensRelatorio"][0]["soma"].toString());

      return body;
    } else {
      throw "Não pode encontrar os relatórios finais";
    }
  }

  Future<Map<String, dynamic>> getSubPdc(int id) async {
    Response res = await get(urlSubpdc1);

    if (res.statusCode == 200) {
      Map<String, dynamic> body = json.decode(res.body);
     // print("resultado :" + body["itensRelatorio"][0]["soma"].toString());

      return body;
    } else {
      throw "Não pode encontrar os relatórios finais";
    }
  }

  Future<List<SubPdc>> getSubpdcs() async {
    Response res = await get(urlRelatorioSubPdc);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<SubPdc> posts =
      body.map((dynamic item) => SubPdc.fromJson(item)).toList();

      return posts;
    } else {
      throw "Não foi possivel retornar os subpdcs";
    }
  }
}
