class Trip {
  late String? id;
  late String? name;
  late String? salida;
  late String? descripcion;

  Trip({this.id, this.name, this.salida, this.descripcion});

  factory Trip.fromMap(Map<String, dynamic> obj) => Trip(
        id: obj['id'],
        name: obj['name'],
        salida: obj['salida'],
        descripcion: obj['descripcion'],
      );
}
