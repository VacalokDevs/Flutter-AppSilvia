import 'package:flutter/material.dart';

import '../../models/noticia.dart';

class Noticia3Screen extends StatelessWidget {
  final Noticia noticia;

  Noticia3Screen({required this.noticia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticia 3'),
      ),
      body: Center(
        child: Text('Noticia 3'),
      ),
    );
  }
}
