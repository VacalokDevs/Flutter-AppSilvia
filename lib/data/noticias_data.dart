import '../models/noticia.dart';

class NoticiasData {
  static List<Noticia> noticias = [
    Noticia(
      id: 1,
      imagen: 'assets/images/noticias/noticia1/noticia1_0.jpg',
      titulo: '¡Bienvenido a Silvia! Descubre la App',
      descripcion:
          'La aplicación en el municipio de Silvia que te conecta con todo lo que necesitas en un solo lugar.',
      textoCompleto:
          'La aplicación en el municipio de Silvia que te conecta con todo lo que necesitas en un solo lugar.',
      imagenesRelacionadas: [
        'assets/images/noticias/noticia1/noticia1_0.jpg',
      ],
      backgroundImage: 'assets/images/noticias/noticia1/noticia1_0.jpg',
    ),
    Noticia(
      id: 2,
      imagen: 'assets/images/noticias/noticia2/noticia2_0.jpg',
      titulo: 'Descubre Silvia',
      descripcion: 'Explora la naturaleza y cultura de Silvia como nunca antes. ¡Pronto, toda la información que necesitas para una visita inolvidable!',
      textoCompleto:
          'Explora la naturaleza y cultura de Silvia como nunca antes. ¡Pronto, toda la información que necesitas para una visita inolvidable!',
      imagenesRelacionadas: [
        'assets/images/noticias/noticia2/noticia2_0.jpg',
        'assets/images/noticias/noticia2/noticia2_1.jpg',
        'assets/images/noticias/noticia2/noticia2_2.jpg',
      ],
      backgroundImage: 'assets/images/noticias/noticia2/noticia2_0.jpg',
    ),
  ];
}
