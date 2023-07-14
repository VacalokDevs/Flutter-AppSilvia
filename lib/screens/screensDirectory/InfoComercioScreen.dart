import 'package:flutter/material.dart';

import '../../helpers/indicator_builder.dart';
import '../../models/comercio.dart';
import '../../data/comercios_data.dart';

class InfoComercioScreen extends StatefulWidget {
  final Comercio comercio;

  InfoComercioScreen({required this.comercio});

  @override
  _InfoComercioScreenState createState() => _InfoComercioScreenState();
}

class _InfoComercioScreenState extends State<InfoComercioScreen> {
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages = [widget.comercio.imagenComercio];
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _buildIndicator() {
    return IndicatorBuilder.buildIndicator(
        _currentIndex, _backgroundImages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.comercio.nombre),
        titleTextStyle: TextStyle(
          fontFamily: 'Helvetica-Bold',
          fontSize: 22,
        ),
        backgroundColor: widget.comercio.color,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImages[_currentIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment(0, -0.3),
                colors: [Colors.black, Colors.transparent],
                stops: [0.0, 0.75],
              ).createShader(bounds);
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_backgroundImages[_currentIndex]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
            child: Column(
              children: [
                Expanded(
                  child: Container(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/resourcesMarcaSilvia/MarcaSilvia-Boton.png', // Reemplaza 'ruta_de_la_imagen' con la ruta de la imagen que deseas mostrar
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(
                                width:
                                    8), // Ajusta el espacio entre la imagen y el texto según tus necesidades
                            Text(
                              widget.comercio.direccion,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Helvetica-Light',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/resourcesMarcaSilvia/MarcaSilvia-Boton.png', // Reemplaza 'ruta_de_la_imagen' con la ruta de la imagen que deseas mostrar
                              width: 25,
                              height: 25,
                            ),
                            SizedBox(
                                width:
                                    8), // Ajusta el espacio entre la imagen y el texto según tus necesidades
                            Text(
                              widget.comercio.telefono,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Helvetica-Light',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.comercio.imagenesRelacionadas
                                .asMap()
                                .entries
                                .map((entry) {
                              final index = entry.key;
                              final imagen = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _backgroundImages[_currentIndex] = imagen;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15),
                                  height:
                                      MediaQuery.of(context).size.width / 4.6,
                                  width:
                                      MediaQuery.of(context).size.width / 4.1,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(imagen),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
