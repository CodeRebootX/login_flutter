import 'package:flutter/material.dart';
import 'package:inicio_sesion/models/user.dart';
import 'package:inicio_sesion/logica/logica.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage ({super.key});
  @override
  State<MyRegisterPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyRegisterPage> {
  
  final _formKey = GlobalKey<FormState>();

  String? _trato;
  File? _imagen;
  int? _edad;
  String _usuario = "";
  String _password = "";
  String _repitePassword = "";
  String _lugarNacimiento = "";
  bool _aceptaTerminos = false;

  final ImagePicker _picker = ImagePicker();

  // Método para seleccionar imagen
  Future<void> _seleccionarImagen() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagen = File(pickedFile.path);
      });
    }
  }

  // Método para registrar usuario
  void _registrarUsuario() {
    if (_formKey.currentState!.validate()) {
      if (!_aceptaTerminos) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Debes aceptar los términos y condiciones")),
        );
        return;
      }

      // Guardamos el usuario en la lógica
      User nuevoUsuario = User(nombre: _usuario, pass: _password);
      Logica.aniadirUser(nuevoUsuario);

      // Cerrar el diálogo y mostrar confirmación
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Usuario registrado con éxito")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Registro de Usuario"),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Trato
              DropdownButtonFormField<String>(
                value: _trato,
                decoration: InputDecoration(labelText: "Trato"),
                items: ["Sr.", "Sra."].map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
                onChanged: (value) => setState(() => _trato = value),
                validator: (value) => value == null ? "Seleccione un trato" : null,
              ),
              
              // Imagen
              GestureDetector(
                onTap: _seleccionarImagen,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: _imagen != null ? FileImage(_imagen!) : null,
                  child: _imagen == null ? Icon(Icons.camera_alt, size: 40) : null,
                ),
              ),
              SizedBox(height: 10),

              // Edad
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Edad"),
                onChanged: (value) => setState(() => _edad = int.tryParse(value)),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Ingrese su edad";
                  final edad = int.tryParse(value);
                  if (edad == null || edad < 18) return "Debe ser mayor de 18 años";
                  return null;
                },
              ),

              // Usuario
              TextFormField(
                decoration: InputDecoration(labelText: "Usuario"),
                onChanged: (value) => setState(() => _usuario = value),
                validator: (value) => value!.isEmpty ? "Ingrese un usuario" : null,
              ),

              // Contraseña
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Contraseña"),
                onChanged: (value) => setState(() => _password = value),
                validator: (value) => value!.length < 6 ? "Mínimo 6 caracteres" : null,
              ),

              // Repetir Contraseña
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Repite Contraseña"),
                onChanged: (value) => setState(() => _repitePassword = value),
                validator: (value) => value != _password ? "Las contraseñas no coinciden" : null,
              ),

              // Lugar de nacimiento
              TextFormField(
                decoration: InputDecoration(labelText: "Lugar de Nacimiento"),
                onChanged: (value) => setState(() => _lugarNacimiento = value),
                validator: (value) => value!.isEmpty ? "Ingrese su lugar de nacimiento" : null,
              ),

              // Términos y Condiciones
              Row(
                children: [
                  Checkbox(
                    value: _aceptaTerminos,
                    onChanged: (value) => setState(() => _aceptaTerminos = value!),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _aceptaTerminos = !_aceptaTerminos),
                      child: Text(
                        "Acepto los términos y condiciones",
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Cancelar")),
        ElevatedButton(onPressed: _registrarUsuario, child: Text("Registrar")),
      ],
    );
  }
}