import 'dart:convert';

class ModelBuscarCep {
  String cep;
  String logradouro;
  String complemento;
  String bairro;
  String localidade;
  String uf;
  String ddd;

  ModelBuscarCep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.ddd,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ddd': ddd,
    };
  }

  String toJson() => jsonEncode(toMap());


  

  factory ModelBuscarCep.fromMap(Map<String, dynamic> map) {
    return ModelBuscarCep(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      ddd: map['ddd'] ?? '',
    );
  }

  factory ModelBuscarCep.fromJson(String json) =>
      ModelBuscarCep.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'BuscarCep(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ddd: $ddd)';
  }
}
