import 'package:flutter/material.dart';
import 'package:flutter_portifolio/pages/dashboard_page.dart';
import 'package:flutter_portifolio/pages/viacep_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'APP',
        routes: {
          '/': (_) => const DashboardPage(),
          '/viacep': (_) => const ViacepPage(),
        },
      ),
    );
  }
}
