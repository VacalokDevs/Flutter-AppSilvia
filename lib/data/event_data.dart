import 'package:flutter/material.dart';
import '../models/eventModel.dart';

class EventData {
  static List<EventModel> events = [
    EventModel(
      title: 'Semana Santa',
      description: 'Semana Santa',
      eventImage: 'assets/images/eventos/SemanaSanta/CC-SS-01.jpg',
      day: 02,
      month: 'Abril',
      color: const Color.fromARGB(171, 0, 106, 168),
      imagenesRelacionadas: [
        'assets/images/eventos/SemanaSanta/CC-SS-01.jpg',
        'assets/images/eventos/SemanaSanta/CC-SS-02.jpg',
        'assets/images/eventos/SemanaSanta/CC-SS-03.jpg',
        'assets/images/eventos/SemanaSanta/CC-SS-04.jpg',
        'assets/images/eventos/SemanaSanta/CC-SS-05.jpg',
      ],
    ),
    EventModel(
      title: 'Festidanzas',
      description: 'Festidanzas',
      eventImage: 'assets/images/eventos/Festidanzas/CC-FD-01.jpg',
      day: 29,
      month: 'Junio',
      color: const Color.fromARGB(171, 0, 106, 168),
      imagenesRelacionadas: [
        'assets/images/eventos/Festidanzas/CC-FD-01.jpg',
        'assets/images/eventos/Festidanzas/CC-FD-02.jpg',
        'assets/images/eventos/Festidanzas/CC-FD-03.jpg',
        'assets/images/eventos/Festidanzas/CC-FD-04.jpg',
        'assets/images/eventos/Festidanzas/CC-FD-05.jpg',
      ],
    ),
    EventModel(
      title: 'Metamonos Al Cuento',
      description: 'Metamonos Al Cuento',
      eventImage: 'assets/images/eventos/MetamonosAlCuento/CC-MAC-01.jpg',
      day: 14,
      month: 'Julio',
      color: const Color.fromARGB(171, 0, 135, 180),
      imagenesRelacionadas: [
        'assets/images/eventos/MetamonosAlCuento/CC-MAC-01.jpg',
        'assets/images/eventos/MetamonosAlCuento/CC-MAC-02.jpg',
        'assets/images/eventos/MetamonosAlCuento/CC-MAC-03.jpg',
        'assets/images/eventos/MetamonosAlCuento/CC-MAC-04.jpg',
        'assets/images/eventos/MetamonosAlCuento/CC-MAC-05.jpg',
      ],
    ),
    EventModel(
      title: 'Danza Al Parque',
      description: 'Danza Al Parque',
      eventImage: 'assets/images/eventos/DanzaAlParque/CC-DP-01.jpg',
      day: 00,
      month: 'Por Definir',
      color: const Color.fromARGB(171, 0, 135, 180),
      imagenesRelacionadas: [
        'assets/images/eventos/DanzaAlParque/CC-DP-01.jpg',
      ],
    ),
    EventModel(
      title: 'Festival De Bandas',
      description: 'Festival De Bandas',
      eventImage: 'assets/images/eventos/FestivalDeBandas/CC-FB-01.jpg',
      day: 00,
      month: 'Por Definir',
      color: const Color.fromARGB(171, 0, 106, 168),
      imagenesRelacionadas: [
        'assets/images/eventos/FestivalDeBandas/CC-FB-01.jpg',
        'assets/images/eventos/FestivalDeBandas/CC-FB-02.jpg',
        'assets/images/eventos/FestivalDeBandas/CC-FB-03.jpg',
      ],
    ),
    EventModel(
      title: 'Feria 360',
      description: 'Feria 360',
      eventImage: 'assets/images/eventos/Feria360/CC-F-01.jpg',
      day: 00,
      month: 'Por Definir',
      color: const Color.fromARGB(171, 0, 135, 180),
      imagenesRelacionadas: [
        'assets/images/eventos/Feria360/CC-F-01.jpg',
        'assets/images/eventos/Feria360/CC-F-02.jpg',
        'assets/images/eventos/Feria360/CC-F-03.jpg',
        'assets/images/eventos/Feria360/CC-F-04.jpg',
      ],
    ),
    EventModel(
      title: 'Fiesta P. Ntra. Sra. de Chiquinquirá',
      description: 'Fiesta P. Ntra. Sra. de Chiquinquirá',
      eventImage:
          'assets/images/eventos/FiestaNuestraSeñoraChiquinquira/CC-CH-01.jpg',
      day: 00,
      month: 'Por Definir',
      color: const Color.fromARGB(171, 0, 135, 180),
      imagenesRelacionadas: [
        'assets/images/eventos/FiestaNuestraSeñoraChiquinquira/CC-CH-01.jpg',
        'assets/images/eventos/FiestaNuestraSeñoraChiquinquira/CC-CH-02.jpg',
        'assets/images/eventos/FiestaNuestraSeñoraChiquinquira/CC-CH-03.jpg',
      ],
    ),
  ];
}
