class Noticia {
  int id;
  String titulo;
  String descripcion;
  String imagen;
  String textoCompleto;
  String backgroundImage;
  List<String> imagenesRelacionadas;

  Noticia({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.textoCompleto,
    required this.backgroundImage,
    required this.imagenesRelacionadas,
  });
}
