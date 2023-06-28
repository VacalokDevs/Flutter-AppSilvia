import '../models/noticia.dart';

class NoticiasData {
  static List<Noticia> noticias = [
    Noticia(
      id: 1,
      imagen: 'assets/images/noticias/noticia1/noticia1_0.jpg',
      titulo: 'Lago Chimán',
      descripcion:
          'Descripción de la Noticia 1 - Descripción de la Noticia 1 - Descripción de la Noticia 1 - Descripción de la Noticia 1',
      textoCompleto:
          'Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia',
      imagenesRelacionadas: [
        'assets/images/noticias/noticia1/noticia1_0.jpg',
        'assets/images/noticias/noticia1/noticia1_1.jpg',
        'assets/images/noticias/noticia1/noticia1_2.jpg',
        'assets/images/noticias/noticia1/noticia1_3.jpg',
        'assets/images/noticias/noticia1/noticia1_4.jpg',
        'assets/images/noticias/noticia1/noticia1_5.jpg',
      ],
    ),
    Noticia(
      id: 2,
      imagen: 'assets/images/noticias/noticia2/noticia2_0.jpg',
      titulo: 'Semana Santa 2023',
      descripcion: 'Descripción de la Noticia 2',
      textoCompleto:
          'Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia',
      imagenesRelacionadas: [
        'assets/images/noticias/noticia2/noticia2_0.jpg',
        'assets/images/noticias/noticia2/noticia2_1.jpg',
        'assets/images/noticias/noticia2/noticia2_2.jpg',
      ],
    ),
    Noticia(
      id: 3,
      imagen: 'assets/images/1.jpg',
      titulo: 'Nuestro Patrimonio',
      descripcion: 'Descripción de la Noticia 3',
      textoCompleto:
          'Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia - Texto Completo de la noticia',
      imagenesRelacionadas: [],
    ),
  ];
}
