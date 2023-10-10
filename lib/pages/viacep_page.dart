import 'package:flutter/material.dart';
import 'package:flutter_portifolio/modules/cep/buscar_cep.dart';
import 'package:flutter_portifolio/repositories/repository.dart';

class ViacepPage extends StatefulWidget {
  const ViacepPage({super.key});

  @override
  State<ViacepPage> createState() => _ViacepPageState();
}

class _ViacepPageState extends State<ViacepPage> {
  final cepRepository = Repository();

  Future<BuscarCep> pegaDados() async {
    final cep = await cepRepository.buscarMyCep();
    print('Teste Cep: $cep');
    return cep;
  }

  var dados = BuscarCep(
    cep: '',
    bairro: '',
    complemento: '',
    localidade: '',
    logradouro: '',
    uf: '',
    ddd: '',
  );

  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback((timestamp) async => dados = await pegaDados());
    setState(() {
      Future.delayed(
        Duration.zero,
        () async => dados = await pegaDados(),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dados.cep.isEmpty) {
      print('Dados vazio.');
    } else {
      print('CEPPP: ${dados.cep}');
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CEP: ${dados.cep}'),

              // Text(dados.logradouro),
              // Text(dados.complemento),
              // Text(dados.bairro),
              // Text(dados.localidade),
              // Text(dados.uf),
              // Text(dados.ddd),
            ],
          ),
        ),
      ),
    );
  }
}
