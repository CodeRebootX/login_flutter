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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool obscureText = true;

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
    if (_formKey.currentState==null) {
      return;
    }
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String user = userController.text;
      String pass = passController.text;
      if (user == 'admin' && pass == 'admin') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sesión iniciada correctamente')
          ),
        );
        openStarted();
        return;
      }
      for (final e in lista) {
        tempName = e.getName;
        tempPass = e.getPass;
        if (tempName == user && tempPass == pass) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Sesión iniciada correctamente')
            ),
          );
          openStarted();
          return;
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Usuario o contraseña incorrecta')
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
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
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: TextFormField(
                      controller: userController,
                      decoration: InputDecoration(
                        labelText: 'Usuario',
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Enter your username' : null,
                      onTap: () {
                        setState(() {
                          _formKey.currentState!.reset();
                        });
                      },
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 40,
                  width: 300,
                  child: TextFormField(
                    controller: passController,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(
                        fontSize: 10
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                      ),
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                    onTap: () {
                        setState(() {
                          _formKey.currentState!.reset();
                        });
                      },
                  ),
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
      ),
    );
  }
}