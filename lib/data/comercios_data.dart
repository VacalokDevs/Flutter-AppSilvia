import '../models/comercio.dart';
import 'tipos_comercios_data.dart';

class ComerciosData {
  static List<Comercio> comercios = [
    //EMERGENCIA
    Comercio(
      nombre: 'EMERGENCIA 1',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[0].icono,
    ),
    //RESTAURANTES
    Comercio(
      nombre: 'Restaurante 1',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio: 'assets/images/directorio/restaurante/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Calle Principal, Ciudad',
      telefono: '+1234567890',
      whatsapp: '+1234567890',
      facebook: 'facebook.com/restaurante1',
      instagram: 'instagram.com/restaurante1',
      ubicacion: [12.3456, -98.7654],
    ),
    Comercio(
      nombre: 'Restaurante 2',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio: 'assets/images/directorio/restaurante/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Calle Principal, Ciudad',
      telefono: '+1234567890',
      whatsapp: '+1234567890',
      facebook: 'facebook.com/restaurante1',
      instagram: 'instagram.com/restaurante1',
      ubicacion: [12.3456, -98.7654],
    ),
    Comercio(
      nombre: 'Restaurante 3',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio: 'assets/images/directorio/restaurante/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Calle Principal, Ciudad',
      telefono: '+1234567890',
      whatsapp: '+1234567890',
      facebook: 'facebook.com/restaurante1',
      instagram: 'instagram.com/restaurante1',
      ubicacion: [12.3456, -98.7654],
    ),
    //HOTELES
    Comercio(
      nombre: 'HOTELES 2',
      tipo: TiposComercioData.tiposComercio[2].tipo,
      color: TiposComercioData.tiposComercio[2].color,
      imagenComercio: 'assets/images/directorio/hotel/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hotel/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[2].icono,
    ),
    //TIENDAS
    Comercio(
      nombre: 'TIENDAS 1',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio: 'assets/images/directorio/tienda/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/tienda/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[3].icono,
    ),
    //ARTESANIAS
    Comercio(
      nombre: 'ARTESANIAS 1',
      tipo: TiposComercioData.tiposComercio[4].tipo,
      color: TiposComercioData.tiposComercio[4].color,
      imagenComercio: 'assets/images/directorio/artesania/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/artesania/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[4].icono,
    ),
    //MECANICO
    Comercio(
      nombre: 'MECANICO 1',
      tipo: TiposComercioData.tiposComercio[5].tipo,
      color: TiposComercioData.tiposComercio[5].color,
      imagenComercio: 'assets/images/directorio/mecanico/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/mecanico/principal.jpg',
      ],
      icono: TiposComercioData.tiposComercio[5].icono,
    ),
  ];
}
