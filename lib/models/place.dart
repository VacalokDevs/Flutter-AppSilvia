class Place {
  final String nombre;
  final String tipoDeLugar;
  final String descripcion;
  final String imagenLugar;
  final List<String> imagenesRelacionadas;
  final String googleMapsLink; // New field for Google Maps link

  Place({
    required this.nombre,
    required this.tipoDeLugar,
    required this.descripcion,
    required this.imagenLugar,
    required this.imagenesRelacionadas,
    required this.googleMapsLink, // Initialize the new field
  });
}
