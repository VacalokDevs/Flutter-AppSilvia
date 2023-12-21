import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String description;
  final String eventImage;
  final int day;
  final String month; // Puede ser un String o un enum para los meses
  final Color color;
  final List<String> imagenesRelacionadas;

  EventModel({
    required this.title,
    required this.description,
    required this.eventImage,
    required this.day,
    required this.month,
    required this.color,
    required this.imagenesRelacionadas,
  });
}
