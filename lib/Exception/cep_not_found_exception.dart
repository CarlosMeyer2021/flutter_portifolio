// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter_portifolio/modules/cep/model_buscar_cep.dart';

class CepNotFoundException implements Exception {
  final String cause;
  CepNotFoundException({
    required this.cause,
  });

  get http => null;

  Future<ModelBuscarCep?> buscarMyCep({required String pegaCep}) async {
    try {
      var url = 'https://viacep.com.br/ws/$pegaCep/json/';
      var cepResponse = await http.get(Uri.parse(url));
      cepResponse.statusCode;
      final cep = jsonDecode(cepResponse.body) as Map<String, dynamic>;

      if (cep.containsKey('erro')) {
        throw Exception('Cep não encontrado');
      }else if(cep.isEmpty){
        throw const FormatException('Favor preencher o campo com cep válido.');
      }
      final myCep = ModelBuscarCep.fromMap(cep);
      return myCep;
    } catch (e) {
      print(e);
    }
    return null;
  }
}
