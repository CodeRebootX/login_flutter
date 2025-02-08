class User {
  String nombre;
  String pass;

  String get getName {
    return nombre;
  }

  set setName (String name) {
    nombre=name;
  }

  String get getPass {
    return pass;
  }

  set setPass (String pss) {
    pass=pss;
  }

  User({required this.nombre, required this.pass});

}