import 'package:flutter/material.dart';
import 'package:flutter_portifolio/repositories/repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  var cepRepository = Repository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cepRepository.pegaCep,           
        
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.location_on,
                    color: Colors.blue,
                    size: 30,
                  ),
                  labelText: 'CEP',
                  hintText: 'Digite o numero do CEP',
                  labelStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                  ),
                  border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),


              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/viacep');
                  //print('CEP ' + controllerCep.text);
                },
                child: const Text('CEP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
