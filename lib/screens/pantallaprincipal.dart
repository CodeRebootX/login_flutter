import 'package:flutter/material.dart';
import 'package:inicio_sesion/commons/custombutton.dart';
import 'package:inicio_sesion/screens/pantallaregistro.dart';
import 'package:inicio_sesion/logica/logica.dart';
import 'package:inicio_sesion/screens/pantallainicio.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  void openRegister (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const MyRegisterPage())
    );
  }

  void openStarted (){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context)=>const MyStartedPage())
    );
  }

  void startSession(){
    var lista = Logica.listaRegistro;
    String tempName;
    String tempPass;
    for (final e in lista) {
      tempName = e.getName;
      tempPass = e.getPass;
      if (tempName == cnombre.text && tempPass == cpass.text) {
        print('Sesion iniciada');
        openStarted();
      }
    }
  }

  final cnombre = TextEditingController();
  final cpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Image.asset(
                'assets/images/bmw.png',
                width: 100,
                height: 100,
                fit:BoxFit.cover,),
              
            ),
            SizedBox(
              width: 300,
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Usuario'
                ),
                controller: cnombre,
              ),
            ),

            SizedBox(
              width: 300,
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña'
                ),
                controller: cpass,
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomEButton(
                text: 'Iniciar',
                myFunction: startSession
              )
            ),
            CustomEButton(text: 'Registro', myFunction: openRegister),
          ],
        ),
      ),
    );
  }
}