import 'package:flutter/material.dart';

import 'routes/rutas.dart';

void main() => runApp(Maquillajes());

class Maquillajes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryIconTheme: IconThemeData(color: Colors.black),
      ),
      title: 'Maquillajes',
      initialRoute: 'inicio',
      routes: rutas(),
      debugShowCheckedModeBanner: false,
    );
  }
}
