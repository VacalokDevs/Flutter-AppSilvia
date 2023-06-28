import 'package:flutter/material.dart';
import '../models/tipo_comercio.dart';

class TiposComercioData {
  static List<TipoComercio> tiposComercio = [
    TipoComercio(
        tipo: 'Emergencia',
        color: Color.fromARGB(146, 255, 135, 135),
        tipoImagen: 'assets/images/directorio/emergencia/principal.jpg',
        icono: 'assets/images/directorio/iconos/icon_Emergencia.png'),
    TipoComercio(
      tipo: 'Restaurantes',
      color: Color.fromARGB(171, 255, 174, 0),
      tipoImagen: 'assets/images/directorio/restaurante/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Restaurante.png',
    ),
    TipoComercio(
      tipo: 'Hoteles',
      color: Color.fromARGB(172, 255, 238, 0),
      tipoImagen: 'assets/images/directorio/hotel/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Hotel.png',
    ),
    TipoComercio(
      tipo: 'Tiendas',
      color: Color.fromARGB(171, 244, 3, 184),
      tipoImagen: 'assets/images/directorio/tienda/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Tienda.png',
    ),
    TipoComercio(
      tipo: 'Artesanias',
      color: Color.fromARGB(179, 123, 255, 129),
      tipoImagen: 'assets/images/directorio/artesania/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Artesania.png',
    ),
    TipoComercio(
      tipo: 'Taller Mecánicos',
      color: Color.fromARGB(171, 82, 137, 255),
      tipoImagen: 'assets/images/directorio/mecanico/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Taller.png',
    ),
  ];
}
