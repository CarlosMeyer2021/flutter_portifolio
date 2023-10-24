import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final cepEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //if

  var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[900],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 200,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                if (value == '') {
                                  return 'Campo Cep não pode ser vazio.';
                                }
                                return null;
                              },
                              controller: cepEC,
                              inputFormatters: [maskFormatter],
                              style: const TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                              decoration: const InputDecoration(
                                fillColor: Colors.red,
                                suffixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                labelText: 'CEP',
                                labelStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                hintText: 'Digite o numero do CEP',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  //borderSide: BorderSide(color: Colors.white),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20.0)),
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(double.maxFinite, 70),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              label: const Text('BUSCAR CEP'),
                              icon: const Icon(
                                Icons.location_on,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.of(context)
                                      .pushNamed('/viacep', arguments: {
                                    'cep': cepEC.text,
                                    //'nome': 'Carlos Meyer',
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
