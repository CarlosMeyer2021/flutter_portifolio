import 'package:flutter/material.dart';
import 'package:flutter_portifolio/modules/cep/buscar_cep.dart';
import 'package:flutter_portifolio/pages/splash_page.dart';
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
    return cep;
  }

  Future<BuscarCep?>? dados;

  @override
  void initState() {
    super.initState();
    dados = pegaDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CEP'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        color: Colors.grey,
        
        child: FutureBuilder<BuscarCep?>(
            future: dados,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const CircularProgressIndicator.adaptive();
                case ConnectionState.active:
                case ConnectionState.done:
                  final dadosCep = snapshot.data;
                  final cepSplash = dadosCep?.cep;
                  print(cepSplash);
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text('CEP: ${dadosCep?.cep}'),
                        Text('LOGRADOURO: ${dadosCep?.logradouro}'),
                        Text('COMPLEMENTO: ${dadosCep?.complemento}'),
                        Text('BAIRRO: ${dadosCep?.bairro}'),
                        Text('LOCALIDADE: ${dadosCep?.localidade}'),
                        Text('DDD: ${dadosCep?.ddd}'),
                      ],
                    ),
                  );
              }
            }),
      ),
    );
  }
}