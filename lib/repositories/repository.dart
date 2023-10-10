import 'dart:convert';
import 'package:flutter_portifolio/modules/cep/buscar_cep.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<BuscarCep> buscarMyCep() async {
    const url = 'https://viacep.com.br/ws/01001000/json/';

    var cepResponse = await http.get(Uri.parse(url));

    final cep = jsonDecode(cepResponse.body);

    final myCep = BuscarCep.fromJson(cep);

    return myCep;
  }
}
