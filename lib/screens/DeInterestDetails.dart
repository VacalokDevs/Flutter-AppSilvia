import 'package:flutter/material.dart';
import '../../models/place.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/back_button.dart';

class DeInteresDetails extends StatefulWidget {
  final Place place;

  const DeInteresDetails({Key? key, required this.place}) : super(key: key);

  @override
  _DeInteresDetailsState createState() => _DeInteresDetailsState();
}

class _DeInteresDetailsState extends State<DeInteresDetails> {
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages = [widget.place.imagenLugar];
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
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
                end: Alignment(0, -0.9),
                colors: [Colors.black, Colors.transparent],
                stops: [0.0, 0.85],
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
                    widthFactor: 1.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.place.tipoDeLugar,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Helvetica-Cond',
                          ),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          widget.place.nombre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.place.descripcion,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Helvetica-Light',
                          ),
                        ),
                        const SizedBox(height: 25),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.place.imagenesRelacionadas
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
                                  margin: const EdgeInsets.only(right: 15),
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
                        const SizedBox(height: 25),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              final googleMapsUri =
                                  Uri.parse(widget.place.googleMapsLink);
                              launchUrl(googleMapsUri,
                                  mode: LaunchMode.externalApplication);
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
                              child: Image.asset(
                                'assets/images/lugares/iconos/icon-Como-Llegar-Blanco.png',
                                fit: BoxFit.cover,
                              ),
                            ),
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
