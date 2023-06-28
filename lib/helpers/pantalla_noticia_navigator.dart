import 'package:flutter/material.dart';
import '../models/noticia.dart';
import '../screens/screensNews/Noticia1Screen.dart';
import '../screens/screensNews/Noticia2Screen.dart';
import '../screens/screensNews/Noticia3Screen.dart';

class PantallaNoticiaNavigator {
  static void abrirPantallaNoticia(BuildContext context, Noticia noticia) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          Widget pantalla;

          switch (noticia.id) {
            case 1:
              pantalla = Noticia1Screen(noticia: noticia);
              break;
            case 2:
              pantalla = Noticia2Screen(noticia: noticia);
              break;
            case 3:
              pantalla = Noticia3Screen(noticia: noticia);
              break;
            default:
              pantalla =
                  Scaffold(); // Pantalla por defecto en caso de que no se encuentre ninguna coincidencia
          }

          return SafeArea(
            child: pantalla,
            bottom:
                false, // Opcionalmente, puedes establecer bottom: false si no quieres aplicar el padding inferior del SafeArea.
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = Curves
              .easeOutQuart; // Cambia la curva de animación a una más suave
          final duration = const Duration(
              milliseconds: 800); // Ajusta la duración de la transición

          return AnimatedOpacity(
            opacity: animation.value,
            duration: duration,
            curve: curve,
            child: Transform.translate(
              offset: Offset(0.0,
                  (1 - animation.value) * MediaQuery.of(context).size.height),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
