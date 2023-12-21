import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/vacalok.dart';
import '../widgets/back_button.dart';

class VacalokDetails extends StatefulWidget {
  final Vacalok vacalok;

  const VacalokDetails({Key? key, required this.vacalok}) : super(key: key);

  @override
  _VacalokDetailsState createState() => _VacalokDetailsState();
}

class _VacalokDetailsState extends State<VacalokDetails> {
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages = [widget.vacalok.imagen];
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
                end: Alignment(0, -0.45),
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
                    widthFactor: 1.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Vacalok',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        const SizedBox(height: 0),
                        Text(
                          widget.vacalok.nombre,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        const SizedBox(height: 15),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: widget.vacalok.imagenesRelacionadas
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Alineación central de los botones
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final whatsappUri =
                                      Uri.parse(widget.vacalok.linkWhatsApp);
                                  launchUrl(whatsappUri,
                                      mode: LaunchMode.externalApplication);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  child: Image.asset(
                                    'assets/images/iconos/WhatsApp-White.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      35), // Separación entre el segundo y tercer botón
                              GestureDetector(
                                onTap: () async {
                                  final facebookUri =
                                      Uri.parse(widget.vacalok.linkFacebook);
                                  launchUrl(facebookUri,
                                      mode: LaunchMode.externalApplication);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  child: Image.asset(
                                    'assets/images/iconos/Facebook-White.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      35), // Separación entre el primer y segundo botón
                              GestureDetector(
                                onTap: () async {
                                  final instagramUri =
                                      Uri.parse(widget.vacalok.linkInstagram);
                                  launchUrl(instagramUri,
                                      mode: LaunchMode.externalApplication);
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.width / 10,
                                  child: Image.asset(
                                    'assets/images/iconos/Instagram-White.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
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
