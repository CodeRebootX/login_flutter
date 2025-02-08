import 'package:flutter/material.dart';
import 'screens/pantallaprincipal.dart';
import 'package:inicio_sesion/models/user.dart';
import 'package:inicio_sesion/logica/logica.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    User admin = User(nombre: 'admin', pass: 'admin');
    Logica.aniadirUser(admin);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inicio de Sesión'),
    );
  }
  
}