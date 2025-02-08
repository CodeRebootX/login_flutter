import 'package:inicio_sesion/models/user.dart';

class Logica  {
  static var listaRegistro = <User>{};

  get lista {
    return listaRegistro;
  }

  static void aniadirUser (User user) {
    listaRegistro.add(user);
  }
}