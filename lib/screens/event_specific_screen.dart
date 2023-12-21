import 'package:flutter/material.dart';
import '../../helpers/indicator_builder.dart';
import '../../models/eventModel.dart';
import '../widgets/back_button.dart'; // Asegúrate de importar el modelo de eventos

class EventoEspecifico extends StatefulWidget {
  final EventModel eventModel;

  const EventoEspecifico({super.key, required this.eventModel});

  @override
  _EventoEspecificoState createState() => _EventoEspecificoState();
}

class _EventoEspecificoState extends State<EventoEspecifico> {
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages = [widget.eventModel.eventImage];
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
              return const LinearGradient(
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
          BackButtonWidget(
          onPressed: () {
            Navigator.of(context).pop();
          }),
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
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Align(
                              alignment: Alignment
                                  .center, // Centra verticalmente los elementos
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    widget.eventModel.day
                                        .toString()
                                        .padLeft(2, '0'),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 70,
                                      fontFamily: 'Helvetica-Bold',
                                    ),
                                  ),
                                  Positioned(
                                    top: 64, // Ajusta la posición vertical
                                    child: Text(
                                      widget.eventModel.month,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Helvetica-Bold',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            width: 2.5,
                            height: 70,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/iconos/Download-Programacion-White.png',
                                  width: 65,
                                  height: 65,
                                ),
                                const SizedBox(height: 4),
                                /*Text(
                                  'PROGRAMACIÓN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'Helvetica-Cond',
                                  ),
                                  textAlign: TextAlign.center,
                                ),*/
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.eventModel.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Helvetica-Bold',
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.eventModel.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Helvetica-Light',
                        ),
                      ),
                      const SizedBox(
                          height:
                              20), // Espacio entre el título y las imágenes relacionadas
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: widget.eventModel.imagenesRelacionadas
                              .asMap()
                              .entries
                              .map((entry) {
                            final index = entry.key;
                            final image = entry.value;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _backgroundImages[_currentIndex] = image;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                height: MediaQuery.of(context).size.width / 4.6,
                                width: MediaQuery.of(context).size.width / 4.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
