import '../models/comercio.dart';
import 'tipos_comercios_data.dart';

class ComerciosData {
  static List<Comercio> comercios = [
    //EMERGENCIA
    Comercio(
      nombre: 'Hospital San Carlos',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/hospital_san_carlos/principal.png',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/hospital_san_carlos/principal.png',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/hospital_san_carlos/principal.png',
      icono: TiposComercioData.tiposComercio[0].icono,
      direccion: 'Calle 4 - 5',
      telefono: '311 325 2585 - 314 814 3702'
    ),
    Comercio(
      nombre: 'Hospital Mamadominga Sede Silvia',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/hospital_mamadominga/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/hospital_mamadominga/principal.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/hospital_mamadominga/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
      direccion: 'Calle 8 N 2-57 B/ Centro',
      telefono: '311 221 6004'
    ),
    Comercio(
      nombre: 'Policia Nacional',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/policia/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/policia/principal.jpg',
        'assets/images/directorio/emergencia/policia/EST-POL-01.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/policia/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
      direccion: 'Cra 3 No 11-27 B/ San Agustin',
      telefono: '320 739 16 05'
    ),
    Comercio(
      nombre: 'Bomberos',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/bomberos/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/bomberos/principal.jpg',
        'assets/images/directorio/emergencia/bomberos/EST-BOM-01.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/bomberos/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
      direccion: 'Cra 3 No 6 - 108',
      telefono: '323 239 4504'
    ),
    /*Comercio(
      nombre: 'Emergencia Médica',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/emergencia_medica/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/emergencia_medica/principal.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/emergencia_medica/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
    ),*/
    Comercio(
      nombre: 'Defensa Civil',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/defensa_civil/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/defensa_civil/principal.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/defensa_civil/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
      //direccion: '',
      telefono: '310 418 4303'
    ),
    Comercio(
      nombre: 'Cruz Roja',
      tipo: TiposComercioData.tiposComercio[0].tipo,
      color: TiposComercioData.tiposComercio[0].color,
      imagenComercio: 'assets/images/directorio/emergencia/cruz_roja/principal.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/emergencia/cruz_roja/principal.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/emergencia/cruz_roja/principal.jpg',
      icono: TiposComercioData.tiposComercio[0].icono,
      telefono: '310 519 1170'
    ),
    //RESTAURANTES
    Comercio(
      nombre: 'Trucha y Sazón',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio:
          'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-01.jpg',
        'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-02.jpg',
        'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-03.jpg',
        'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-04.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/restaurante/trucha_y_sazon/D-RE-TS-02.jpg',
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Cra. 3 #4-57',
      telefono: '320 782 4618',
      linkWhatsApp: 'https://wa.me/+573207824618',
      /*
      linkFacebook: 'https://facebook.com/',
      linkInstagram: 'https://instagram.com/',
      */
      googleMapsLink:
          'https://www.google.com/maps/place/Trucha+y+Saz%C3%B3n/@2.6095334,-76.3818531,15z/data=!4m6!3m5!1s0x8e3aa6b96907cba9:0x26c963d06bd3c04c!8m2!3d2.6095334!4d-76.3818531!16s%2Fg%2F11c2kcrsz6?entry=ttu',
    ),
    Comercio(
      nombre: 'La Playa',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio:
          'assets/images/directorio/restaurante/la_playa/D-RE-LP-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/la_playa/D-RE-LP-01.jpg',
        'assets/images/directorio/restaurante/la_playa/D-RE-LP-02.jpg',
        'assets/images/directorio/restaurante/la_playa/D-RE-LP-03.jpg',
        'assets/images/directorio/restaurante/la_playa/D-RE-LP-04.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/restaurante/la_playa/D-RE-LP-01.jpg',
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Km 1 Vía Silvia - Resguardo de Guambía',
      telefono: '320 698 2495',
      linkWhatsApp: 'https://wa.me/+573206982495',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100054512796984',
      linkInstagram: '__laplaya__',
      googleMapsLink:
          'https://www.google.com/maps/place/Restaurante+Y+Estadero+La+Playa/@2.6207988,-76.3661707,17z/data=!3m1!4b1!4m6!3m5!1s0x8e3aa4002705f2eb:0x2e96c2f13de6b098!8m2!3d2.6207934!4d-76.3635904!16s%2Fg%2F11c60fr889?entry=ttu',
    ),
    /*Comercio(
      nombre: 'Mirador de la Aurora',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio:
          'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-01.jpg',
        'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-02.jpg',
        'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-03.jpg',
        'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-04.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/restaurante/mirador_aurora/D-RE-MA-01.jpg',
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'km 23 Vía Piendamó - Silvia',
      telefono: '310 654 4326',
      linkWhatsApp: 'https://wa.me/+573106544326',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100064074011142',
      linkInstagram: 'miradordelaaurorasilvia',
      googleMapsLink:
          'https://www.google.com/maps/place/Mirador+de+la+aurora/@2.6019855,-76.3960106,15z/data=!4m2!3m1!1s0x0:0x266b79c1e46e9ea8?sa=X&ved=2ahUKEwib1N-H5u2CAxX5SjABHW47AFIQ_BJ6BAhCEAA',
    ),
    Comercio(
      nombre: 'Café Molino Dorado',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio:
          'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-01.jpg',
        'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-02.jpg',
        'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-03.jpg',
        'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-04.jpg',
        'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-05.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/restaurante/molino_dorado/D-RE-MD-01.jpg',
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Cra. 3 #13-69',
      telefono: '312 776 1455',
      linkWhatsApp: 'https://wa.me/+573127761455',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100064014009959',
      linkInstagram: 'molinodorado_',
      googleMapsLink:
          'https://www.google.com/maps/place/Molino+Dorado+Caf%C3%A9/@2.6142975,-76.3765609,15z/data=!4m2!3m1!1s0x0:0x180235ce1c8325f4?sa=X&ved=2ahUKEwj7-pe05-2CAxWQRTABHUE-BfIQ_BJ6BAg4EAA',
    ),
    Comercio(
      nombre: 'Restaurante Tipico Paisa',
      tipo: TiposComercioData.tiposComercio[1].tipo,
      color: TiposComercioData.tiposComercio[1].color,
      imagenComercio:
          'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-01.jpg',
        'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-02.jpg',
        'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-03.jpg',
        'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-04.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/restaurante/tipico_paisa/D-RE-TP-01.jpg',
      icono: TiposComercioData.tiposComercio[1].icono,
      direccion: 'Cra 2 n. 7-40B',
      telefono: '311 701 7363',
      linkWhatsApp: 'https://wa.me/+573117017363',
      linkFacebook: 'https://www.facebook.com/profile.php?id=RESTAURANTEHOTEL',
      linkInstagram: 'restaurante_tipicopaisa',
      googleMapsLink:
          'https://www.google.com/maps/place/Parrilla+Paisa/@2.6098017,-76.3799003,15z/data=!4m2!3m1!1s0x0:0x53643a536c03f3b2?sa=X&ved=2ahUKEwj99bPr6e2CAxWvTTABHQ4ADKMQ_BJ6BAg8EAA',
    ),*/
    //TIENDAS
    Comercio(
      nombre: 'Merkvana',
      tipo: TiposComercioData.tiposComercio[2].tipo,
      color: TiposComercioData.tiposComercio[2].color,
      imagenComercio: 'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-01.jpg',
        'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-02.jpg',
        'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-03.jpg',
        'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-04.jpg',
      ],
      miniaturaImagenComercio: 'assets/images/directorio/tienda/merkavana/D-HO-TI-MV-01.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      direccion: 'Calle 9 Barrio Centro',
      telefono: '314 538 7848',
      linkWhatsApp: 'https://wa.me/+573145387848',
      //linkFacebook: 'https://www.facebook.com/profile.php?id=vacalokcorporacioncultural',
      //linkInstagram: 'vacalokcorporacioncultural',
      googleMapsLink:
          'https://www.google.com/maps/place/Merkvana/@2.6114564,-76.3796083,15z/data=!4m2!3m1!1s0x0:0x65aaa0f21d07c823?sa=X&ved=2ahUKEwi7wJnbwJKDAxUdr4QIHftkDgEQ_BJ6BAg0EAA',
    ),
    //HOSPEDAJE
    Comercio(
      nombre: 'La Parrilla',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio:
          'assets/images/directorio/hospedaje/la_parrilla/D-HO-LP-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hospedaje/la_parrilla/D-HO-LP-01.jpg',
        'assets/images/directorio/hospedaje/la_parrilla/D-HO-LP-02.jpg',
        'assets/images/directorio/hospedaje/la_parrilla/D-HO-LP-03.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/hospedaje/la_parrilla/D-HO-LP-01.jpg',
      icono: TiposComercioData.tiposComercio[3].icono,
      direccion: 'Cra 3 numero 10-132',
      telefono: '313 656 9394',
      linkWhatsApp: 'https://wa.me/+573136569394',
      linkFacebook: 'https://www.facebook.com/people/Hotel-y-Restaurante-La-Parrilla/100063539592777/',
      googleMapsLink:
          'https://www.google.com/maps/place/Hotel+y+Restaurante+La+Parrilla/@2.612513,-76.3809177,17z/data=!4m14!1m7!3m6!1s0x8e3aa6ba7d07376b:0x7bc343bab19891d8!2sHotel+y+Restaurante+La+Parrilla!8m2!3d2.6125076!4d-76.3783428!16s%2Fg%2F11f06n0rzb!3m5!1s0x8e3aa6ba7d07376b:0x7bc343bab19891d8!8m2!3d2.6125076!4d-76.3783428!16s%2Fg%2F11f06n0rzb?entry=ttu',
    ),
    Comercio(
      nombre: 'Casa Turistica',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio:
          'assets/images/directorio/hospedaje/casa_turistica/D-HO-CT-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hospedaje/casa_turistica/D-HO-CT-01.jpg',
        'assets/images/directorio/hospedaje/casa_turistica/D-HO-CT-02.jpg',
        'assets/images/directorio/hospedaje/casa_turistica/D-HO-CT-03.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/hospedaje/casa_turistica/D-HO-CT-02.jpg',
      icono: TiposComercioData.tiposComercio[3].icono,
      direccion: 'Carrera 2 #14-39',
      telefono: '313 522 3423',
      linkWhatsApp: 'https://wa.me/+573135223423',
      linkFacebook: 'https://www.facebook.com/CasaTuristicaDeSilvia',
      linkInstagram: 'casaturisticadesilvia',
      googleMapsLink:
          'https://www.google.com/maps/place/Casa+Turistica/@2.6142065,-76.3755445,15z/data=!4m2!3m1!1s0x0:0x2642426fb64b9408?sa=X&ved=2ahUKEwi4id33isWBAxWCnokEHa9dD0sQ_BJ6BAhNEAA&ved=2ahUKEwi4id33isWBAxWCnokEHa9dD0sQ_BJ6BAhaEAg',
    ),
    Comercio(
      nombre: 'Hotel Silvia',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio:
          'assets/images/directorio/hospedaje/hotel_silvia/D-HO-HS-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hospedaje/hotel_silvia/D-HO-HS-01.jpg',
        'assets/images/directorio/hospedaje/hotel_silvia/D-HO-HS-02.jpg',
        'assets/images/directorio/hospedaje/hotel_silvia/D-HO-HS-03.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/hospedaje/hotel_silvia/D-HO-HS-01.jpg',
      icono: TiposComercioData.tiposComercio[3].icono,
      direccion: 'Cl. 10 #1 18',
      telefono: '314 478 6603',
      linkWhatsApp: 'https://wa.me/+573144786603',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100095210801633',
      linkInstagram: 'hotelsilviacauca',
      googleMapsLink:
          'https://www.google.com/maps/place/Hotel+Turistico+De+Comfandi/@2.6108548,-76.378087,18z/data=!4m6!3m5!1s0x8e3aa6ba5625eab9:0xa91dc672731ffb55!8m2!3d2.6109271!4d-76.3782265!16s%2Fg%2F11c60006tm?entry=ttu',
    ),
    /*Comercio(
      nombre: 'Posada Nakku',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio:
          'assets/images/directorio/hospedaje/posada_nakku/D-HO-PN-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hospedaje/posada_nakku/D-HO-PN-01.jpg',
        'assets/images/directorio/hospedaje/posada_nakku/D-HO-PN-02.jpg',
        'assets/images/directorio/hospedaje/posada_nakku/D-HO-PN-03.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/hospedaje/posada_nakku/D-HO-PN-01.jpg',
      icono: TiposComercioData.tiposComercio[3].icono,
      direccion: 'Cra 4 clle 2 Esquina, Barrio Caloto',
      telefono: '310 249 8910',
      linkWhatsApp: 'https://wa.me/+573102498910',
      linkFacebook: 'https://www.facebook.com/profile.php?id=posadaturisticanakku',
      linkInstagram: 'posadanakku',
      googleMapsLink:
          'https://www.google.com/maps/place/Posada+Turistica+NAKKU/@2.6093892,-76.387002,17z/data=!3m1!4b1!4m9!3m8!1s0x8e3aa7ec224763a1:0xf0e3eb55e904788f!5m2!4m1!1i2!8m2!3d2.6093838!4d-76.3844271!16s%2Fg%2F11f66tb5b_?entry=ttu',
    ),
    Comercio(
      nombre: 'Birimbi de La Casa De Los Sueños',
      tipo: TiposComercioData.tiposComercio[3].tipo,
      color: TiposComercioData.tiposComercio[3].color,
      imagenComercio:
          'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-01.jpg',
        'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-02.jpg',
        'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-03.jpg',
        'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-04.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/hospedaje/casa_sueños/D-HO-CS-01.jpg',
      icono: TiposComercioData.tiposComercio[3].icono,
      direccion: 'Via Silvia, Totoró',
      telefono: '310 467 5122',
      linkWhatsApp: 'https://wa.me/+573104675122',
      linkFacebook: 'https://www.facebook.com/profile.php?id=lacasasilviacauca',
      linkInstagram: 'birimbi_de_casa_de_los_suenos',
      googleMapsLink:
          'https://www.google.com/maps/place/Birimb%C3%AD+de+la+casa+de+Los+Sue%C3%B1os.+Restaurante,+Glamping+%26+Camping./@2.6117946,-76.3739886,15z/data=!4m2!3m1!1s0x0:0xdb434de88c460b4?sa=X&ved=2ahUKEwjM-ZDU7e2CAxUYZzABHVwDCZQQ_BJ6BAhPEAA',
    ),*/
    //ARTESANIAS
    Comercio(
      nombre: 'Próximamente Más',
      tipo: TiposComercioData.tiposComercio[4].tipo,
      color: TiposComercioData.tiposComercio[4].color,
      imagenComercio: 'assets/images/directorio/Proximamente_2.png',
      imagenesRelacionadas: [
        'assets/images/directorio/Proximamente_2.png',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/artesania/principal.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      direccion: 'Silvia - Cauca',
      telefono: '316 801 1036',
      linkWhatsApp: 'https://wa.me/+573168011036',
      linkFacebook: 'https://www.facebook.com/profile.php?id=vacalokcorporacioncultural',
      linkInstagram: 'vacalokcorporacioncultural',
      googleMapsLink:
          'https://www.google.com/maps/place/Silvia,+Cauca/@2.611615,-76.37754,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC%3Dw114-h86-k-no!7i3968!8i2976!4m7!3m6!1s0x8e3aa6ba4eec9e7b:0xe4e5814ba04dd86c!8m2!3d2.611615!4d-76.37754!10e5!16s%2Fm%2F02qmxbj?entry=ttu',
    ),
    Comercio(
      nombre: 'Leidy Tours',
      tipo: TiposComercioData.tiposComercio[4].tipo,
      color: TiposComercioData.tiposComercio[4].color,
      imagenComercio: 'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-2.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-3.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      telefono: '313 527 3441',
      linkWhatsApp: 'https://wa.me/+573135273441',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100083411707039',
    ),
    //MECANICO
    Comercio(
      nombre: 'Próximamente Más',
      tipo: TiposComercioData.tiposComercio[5].tipo,
      color: TiposComercioData.tiposComercio[5].color,
      imagenComercio: 'assets/images/directorio/Proximamente_2.png',
      imagenesRelacionadas: [
        'assets/images/directorio/Proximamente_2.png',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/mecanico/principal.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      direccion: 'Silvia - Cauca',
      telefono: '316 801 1036',
      linkWhatsApp: 'https://wa.me/+573168011036',
      linkFacebook: 'https://www.facebook.com/profile.php?id=vacalokcorporacioncultural',
      linkInstagram: 'vacalokcorporacioncultural',
      googleMapsLink:
          'https://www.google.com/maps/place/Silvia,+Cauca/@2.611615,-76.37754,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC%3Dw114-h86-k-no!7i3968!8i2976!4m7!3m6!1s0x8e3aa6ba4eec9e7b:0xe4e5814ba04dd86c!8m2!3d2.611615!4d-76.37754!10e5!16s%2Fm%2F02qmxbj?entry=ttu',
    ),
    Comercio(
      nombre: 'Leidy Tours',
      tipo: TiposComercioData.tiposComercio[5].tipo,
      color: TiposComercioData.tiposComercio[5].color,
      imagenComercio: 'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-2.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-3.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      telefono: '313 527 3441',
      linkWhatsApp: 'https://wa.me/+573135273441',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100083411707039',
    ),
    //DROGUERÍAS
    Comercio(
      nombre: 'Farmacenter',
      tipo: TiposComercioData.tiposComercio[6].tipo,
      color: TiposComercioData.tiposComercio[6].color,
      imagenComercio: 'assets/images/directorio/drogueria/farmacenter/D-DR-FC-01.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/drogueria/farmacenter/D-DR-FC-01.jpg',
        'assets/images/directorio/drogueria/farmacenter/D-DR-FC-02.jpg',
        'assets/images/directorio/drogueria/farmacenter/D-DR-FC-03.jpg',
      ],
      miniaturaImagenComercio: 'assets/images/directorio/drogueria/farmacenter/D-DR-FC-01.jpg',
      icono: TiposComercioData.tiposComercio[6].icono,
      direccion: 'Cra. 3 # 9-29 Barrio Centro',
      telefono: '3184720477',
      linkWhatsApp: 'https://wa.me/+573184720477',
      linkFacebook: 'https://www.facebook.com/profile.php?id=61552252904022',
      linkInstagram: 'farmacenter_silvia',
      googleMapsLink:
          'https://www.google.com/maps/place/Farmacenter-Drogueria+Social/@2.6116523,-76.3795435,18.25z/data=!4m6!3m5!1s0x8e3aa7169dbbf4d9:0x6b36fbe2d3c7839a!8m2!3d2.6114546!4d-76.379612!16s%2Fg%2F11gl2bt7dh?entry=ttu',
    ),
    Comercio(
      nombre: 'Farmaunion',
      tipo: TiposComercioData.tiposComercio[6].tipo,
      color: TiposComercioData.tiposComercio[6].color,
      imagenComercio: 'assets/images/directorio/drogueria/farmacenter2/C-DR-DF2-1.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/drogueria/farmacenter2/C-DR-DF2-1.jpg',
        'assets/images/directorio/drogueria/farmacenter2/C-DR-DF2-2.jpg',
        'assets/images/directorio/drogueria/farmacenter2/C-DR-DF2-3.jpg',
      ],
      miniaturaImagenComercio: 'assets/images/directorio/drogueria/farmacenter2/C-DR-DF2-1.jpg',
      icono: TiposComercioData.tiposComercio[6].icono,
      direccion: 'Cra. 3 # 4-72 Barrio Caloto',
      telefono: '321 870 1908',
      linkWhatsApp: 'https://wa.me/+573218701908',
      linkFacebook: 'https://www.facebook.com/profile.php?id=61552252904022',
      linkInstagram: 'farmacenter_silvia',
      googleMapsLink:
          'https://www.google.com/maps/place/Cra.+3+%23479,+Silvia,+Cauca/@2.6096176,-76.3829684,18z/data=!3m1!4b1!4m5!3m4!1s0x8e3aa6b9424fb1c3:0x9b4ac6ecfe55d0b9!8m2!3d2.6096149!4d-76.3816809?entry=ttu',
    ),
    Comercio(
      nombre: 'Próximamente Más',
      tipo: TiposComercioData.tiposComercio[7].tipo,
      color: TiposComercioData.tiposComercio[7].color,
      imagenComercio: 'assets/images/directorio/Proximamente_2.png',
      imagenesRelacionadas: [
        'assets/images/directorio/Proximamente_2.png',
      ],
      miniaturaImagenComercio: 'assets/images/directorio/Proximamente.png',
      icono: TiposComercioData.tiposComercio[7].icono,
      direccion: 'Silvia - Cauca',
      telefono: '316 801 1036',
      linkWhatsApp: 'https://wa.me/+573168011036',
      linkFacebook: 'https://www.facebook.com/profile.php?id=vacalokcorporacioncultural',
      linkInstagram: 'vacalokcorporacioncultural',
      googleMapsLink:
          'https://www.google.com/maps/place/Silvia,+Cauca/@2.611615,-76.37754,3a,75y,90t/data=!3m8!1e2!3m6!1sAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC!2e10!3e12!6shttps:%2F%2Flh5.googleusercontent.com%2Fp%2FAF1QipOl8L3WZt5d64D2CvGdqEpcHQ83dNiku2QNwHeC%3Dw114-h86-k-no!7i3968!8i2976!4m7!3m6!1s0x8e3aa6ba4eec9e7b:0xe4e5814ba04dd86c!8m2!3d2.611615!4d-76.37754!10e5!16s%2Fm%2F02qmxbj?entry=ttu',
    ),
    Comercio(
      nombre: 'Leidy Tours',
      tipo: TiposComercioData.tiposComercio[7].tipo,
      color: TiposComercioData.tiposComercio[7].color,
      imagenComercio: 'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      imagenesRelacionadas: [
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-2.jpg',
        'assets/images/directorio/turismo/leidy_tours/C-T-LT-3.jpg',
      ],
      miniaturaImagenComercio:
          'assets/images/directorio/turismo/leidy_tours/C-T-LT-1.jpg',
      icono: TiposComercioData.tiposComercio[7].icono,
      telefono: '313 527 3441',
      linkWhatsApp: 'https://wa.me/+573135273441',
      linkFacebook: 'https://www.facebook.com/profile.php?id=100083411707039',
    ),
  ];
}
