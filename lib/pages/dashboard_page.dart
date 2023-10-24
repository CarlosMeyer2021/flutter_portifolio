import 'package:flutter/material.dart';
import 'package:flutter_portifolio/pages/splash_page.dart';
import 'package:flutter_portifolio/pages/viacep_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'APP',
        routes: {
          // '/': (_) => const SplashPage(),
          // '/viacep': (_) => const ViacepPage(),
        },
      );
  }
}
