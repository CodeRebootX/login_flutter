import 'package:flutter/material.dart';
import 'package:inicio_sesion/screens/pantallaprincipal.dart';

class MyStartedPage extends StatefulWidget {
  const MyStartedPage ({super.key});
  @override
  State<MyStartedPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyStartedPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Pantalla Inicio Sesión'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: const Text('Pantalla principal'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: 'Pantalla principal')));
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: const Text('Mi perfil'),
              onTap: (){

              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: const Text('Salir'),
              onTap: (){

              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){

              },
              child: const Text('Pantalla Principal')
            ),
          ],
        ),
      )
    );
  }
}