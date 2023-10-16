// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_portifolio/modules/cep/buscar_cep.dart';

class Repository {
  String? pegaCep = '';
  TextEditingController textCep = TextEditingController();
  Future<BuscarCep> buscarMyCep() async {    

    pegaCep = textCep.text;

    var url = 'https://viacep.com.br/ws/$pegaCep/json/';

    var cepResponse = await http.get(Uri.parse(url));

    final cep = jsonDecode(cepResponse.body);

    final myCep = BuscarCep.fromMap(cep);

    return myCep;
  }
}
