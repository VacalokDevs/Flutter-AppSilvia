import 'package:flutter/material.dart';

class Comercio {
  final String nombre;
  final String tipo;
  final Color color;
  final String imagenComercio;
  final String miniaturaImagenComercio;
  final List<String> imagenesRelacionadas;
  final String icono;
  final String direccion;
  final String telefono;
  final String linkWhatsApp;
  final String linkFacebook;
  final String linkInstagram;
  final String googleMapsLink; // New field for Google Maps link

  Comercio({
    required this.nombre,
    required this.tipo,
    required this.color,
    required this.imagenComercio,
    required this.miniaturaImagenComercio,
    required this.imagenesRelacionadas,
    required this.icono,
    String direccion = '',
    String telefono = '',
    String linkWhatsApp = '',
    String linkFacebook = '',
    String linkInstagram = '',
    String googleMapsLink = '',
  })  : direccion = direccion,
        telefono = telefono,
        linkWhatsApp = linkWhatsApp,
        linkFacebook = linkFacebook,
        linkInstagram = linkInstagram,
        googleMapsLink = googleMapsLink;
}
