import 'package:flutter/material.dart';
import 'package:flutter_portifolio/pages/pesquisa_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 219, 227, 233)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ElevatedButton.icon(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const SplashPage()));
              //     //Navigator.of(context).pushNamed('/viacep');
              //   },
              //   icon: const Icon(Icons.location_on),
              //   label: const Text('BUSCA CEP'),
              // ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(double.maxFinite, 70),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  label: const Text('BUSCAR CEP'),
                  icon: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PesquisaPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
