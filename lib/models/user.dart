class User {
  String nombre;
  String pass;
  String trato;
  int edad;
  String imagen;
  String lugarNacimiento;

  String get getName => nombre;
  set setName(String name) => nombre = name;

  String get getPass => pass;
  set setPass(String pss) => pass = pss;

  String get getTrato => trato;
  set setTrato(String t) => trato = t;

  int get getEdad => edad;
  set setEdad(int e) => edad = e;

  String get getImagen => imagen;
  set setImagen(String img) => imagen = img;

  String get getLugarNacimiento => lugarNacimiento;
  set setLugarNacimiento(String ln) => lugarNacimiento = ln;

  User({
    required this.nombre,
    required this.pass,
    required this.trato,
    required this.edad,
    required this.imagen,
    required this.lugarNacimiento,
  });

  @override
  String toString() {
    return 'User(nombre: $nombre, pass: ****, trato: $trato, edad: $edad, imagen: $imagen, lugarNacimiento: $lugarNacimiento)';
  }
}
