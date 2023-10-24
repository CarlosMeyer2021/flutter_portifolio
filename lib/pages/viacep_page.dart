
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
  // String? nome;

  

  Future<BuscarCep?> pegaDados({required String pegaCep2}) async {
    final cep = await cepRepository.buscarMyCep(pegaCep: pegaCep2);
    return cep;
  }

  Future<BuscarCep?>? dados;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final mapCep = (ModalRoute.of(context)?.settings.arguments) as Map;
      if (mapCep.containsKey('cep')) {
        setState(() {
          dados = pegaDados(pegaCep2: mapCep['cep']);
          //nome = mapCep['nome'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print('build');
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: const Text('LOCALIZAÇÃO'),
      ),
      body: Wrap(
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/location2.png'),
                  opacity: 0.2,
                  fit: BoxFit.cover),
            ),
            child: SizedBox(
              // decoration: BoxDecoration(
              //   color: Colors.lightBlue[900],
              // ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.8,

              child: FutureBuilder<BuscarCep?>(
                  future: dados,
                  builder: (context, futureDadosCep) {
                    switch (futureDadosCep.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator.adaptive();
                      case ConnectionState.active:
                      case ConnectionState.done:
                        if (!futureDadosCep.hasData) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.90,
                                height:
                                    MediaQuery.of(context).size.height * 0.50,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error,
                                      size: 60,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      'Ops\n Verifique ser o campo esta vazio \n ou ser o Cep é válido.',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.red),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }

                        if (futureDadosCep.hasError) {
                          return Container(
                            color: Colors.red,
                            child: const Text('ERRO AO RECUPERAR CEP'),
                          );
                        } //
                        final dadosCep = futureDadosCep.data;

                        // if(dadosCep == null){
                        //   return const Text('Invalidos');
                        // }

                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.90,
                                  height:
                                      MediaQuery.of(context).size.height * 0.20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text('${dadosCep?.localidade}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                          )),
                                      Text(' - ${dadosCep?.uf}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.90,
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('CEP: ${dadosCep?.cep}',
                                          style: const TextStyle(
                                              color: Colors.black)),
                                      //Text('Nome: $nome'),

                                      Text('ENDEREÇO: ${dadosCep?.logradouro}',
                                          style: const TextStyle(
                                              color: Colors.black)),

                                      Text(
                                          'COMPLEMENTO: ${dadosCep?.complemento}',
                                          style: const TextStyle(
                                              color: Colors.black)),

                                      Text('BAIRRO: ${dadosCep?.bairro}',
                                          style: const TextStyle(
                                              color: Colors.black)),

                                      Text('DDD: ${dadosCep?.ddd}',
                                          style: const TextStyle(
                                              color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    }
                  }),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     setState(() {
          //       nome = 'Marcus';
          //     });
          //   },
          //   child: const Text('TROCAR NOME'),
          // ),
        ],
      ),
    );
  }
}
