import 'package:flutter/material.dart';
import '../models/tipo_comercio.dart';

class TiposComercioData {
  static List<TipoComercio> tiposComercio = [
    TipoComercio(
        tipo: 'Emergencia',
        color: const Color.fromARGB(199, 146, 19, 19),
        tipoImagen: 'assets/images/directorio/emergencia/principal.jpg',
        icono: 'assets/images/directorio/iconos/icon_Emergencia.png'),
    TipoComercio(
      tipo: 'Restaurantes',
      color: const Color.fromARGB(171, 0, 106, 168),
      tipoImagen: 'assets/images/directorio/restaurante/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Restaurante.png',
    ),
    TipoComercio(
      tipo: 'Tiendas',
      color: const Color.fromARGB(171, 0, 71, 149),
      tipoImagen: 'assets/images/directorio/tienda/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Tienda.png',
    ),
    TipoComercio(
      tipo: 'Hospedajes',
      color: const Color.fromARGB(172, 0, 41, 157),
      tipoImagen: 'assets/images/directorio/hospedaje/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Hotel.png',
    ),
    TipoComercio(
      tipo: 'Artesanias',
      color: const Color.fromARGB(179, 53, 3, 126),
      tipoImagen: 'assets/images/directorio/artesania/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Artesania.png',
    ),
    TipoComercio(
      tipo: 'Talleres Mecánicos',
      color: const Color.fromARGB(171, 97, 0, 159),
      tipoImagen: 'assets/images/directorio/mecanico/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Taller.png',
    ),
    TipoComercio(
      tipo: 'Droguerías',
      color: const Color.fromARGB(171, 155, 1, 159),
      tipoImagen: 'assets/images/directorio/drogueria/principal.jpg',
      icono: 'assets/images/directorio/iconos/icon_Drogueria.png',
    ),
    TipoComercio(
      tipo: 'Próximamente Más',
      color: const Color.fromARGB(171, 144, 2, 74),
      tipoImagen: 'assets/images/directorio/Proximamente.png',
      icono: 'assets/images/directorio/iconos/icon_Prom.png',
    ),
    TipoComercio(
      tipo: 'Próximamente Más',
      color: const Color.fromARGB(171, 127, 0, 21),
      tipoImagen: 'assets/images/directorio/Proximamente.png',
      icono: 'assets/images/directorio/iconos/icon_Prom.png',
    ),
    TipoComercio(
      tipo: 'Próximamente Más',
      color: const Color.fromARGB(171, 180, 0, 1),
      tipoImagen: 'assets/images/directorio/Proximamente.png',
      icono: 'assets/images/directorio/iconos/icon_Prom.png',
    )
  ];
}

/*const FOOD_DATA = [
  {
    "name": "Burger",
    "brand": "Hawkers",
    "price": 2.99,
    "image": "assets/images/directorio/iconos/icon_Taller.png"
  },
  {
    "name": "Cheese Dip",
    "brand": "Hawkers",
    "price": 4.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Cola",
    "brand": "Mcdonald",
    "price": 1.49,
    "image": "cassets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Fries",
    "brand": "Mcdonald",
    "price": 2.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Ice Cream",
    "brand": "Ben & Jerry's",
    "price": 9.49,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Noodles",
    "brand": "Hawkers",
    "price": 4.49,
    "image": "noodles.png"
  },
  {
    "name": "Pizza",
    "brand": "Dominos",
    "price": 17.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Sandwich",
    "brand": "Hawkers",
    "price": 2.99,
    "image": "sandwich.png"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  },
  {
    "name": "Wrap",
    "brand": "Subway",
    "price": 6.99,
    "image": "assets/images/directorio/mecanico/principal.jpg"
  }
];
*/