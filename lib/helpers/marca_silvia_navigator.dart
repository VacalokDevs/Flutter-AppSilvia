import 'package:flutter/material.dart';
import '../screens/MarcaSilviaScreen.dart';

class MarcaSilviaNavigator {
  static void abrirMarcaSilvia(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return MarcaSilviaScreen();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final curve = Curves.easeInOut;

          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, -1.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: curve,
              reverseCurve: curve,
            )),
            child: child,
          );
        },
      ),
    );
  }
}
