import 'dart:convert';
import 'package:flutter_portifolio/Exception/cep_not_found_exception.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_portifolio/modules/cep/model_buscar_cep.dart';

class CepRepository {
  final cepNotFoundException = CepNotFoundException;
   Future<ModelBuscarCep?> buscarMyCep({required String pegaCep}) async {
    try {
      var url = 'https://viacep.com.br/ws/$pegaCep/json/';
      var cepResponse = await http.get(Uri.parse(url));
      cepResponse.statusCode;
      final cep = jsonDecode(cepResponse.body) as Map<String, dynamic>;
      
      if (cep.containsKey('erro') || cep.isEmpty) {
        throw CepNotFoundException(cause: 'Cep não encontrado');
      }
      final myCep = ModelBuscarCep.fromMap(cep);
      return myCep;
    } catch (e) {
      print(e.runtimeType);
    }
    return null;
  }
}


