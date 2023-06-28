import 'package:flutter/material.dart';

class Comercio {
  final String nombre;
  final String tipo;
  final Color color;
  final String imagenComercio;
  final List<String> imagenesRelacionadas;
  final String icono;
  final String direccion;
  final String telefono;
  final String whatsapp;
  final String facebook;
  final String instagram;
  final List<double> ubicacion;

  Comercio({
    required this.nombre,
    required this.tipo,
    required this.color,
    required this.imagenComercio,
    required this.imagenesRelacionadas,
    required this.icono,
    String direccion = '',
    String telefono = '',
    String whatsapp = '',
    String facebook = '',
    String instagram = '',
    List<double> ubicacion = const [],
  })  : this.direccion = direccion,
        this.telefono = telefono,
        this.whatsapp = whatsapp,
        this.facebook = facebook,
        this.instagram = instagram,
        this.ubicacion = ubicacion;
}
