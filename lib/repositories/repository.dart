import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_portifolio/modules/cep/buscar_cep.dart';

class Repository {
  Future<BuscarCep?> buscarMyCep({required String pegaCep}) async {
     try {
      var url = 'https://viacep.com.br/ws/$pegaCep/json/';
      var cepResponse = await http.get(Uri.parse(url));
      cepResponse.statusCode;
      final cep = jsonDecode(cepResponse.body);
      final myCep = BuscarCep.fromMap(cep);
      return myCep;
    } on FormatException
    catch (e) {
      print(e);
    }
    return null;
  }
}
