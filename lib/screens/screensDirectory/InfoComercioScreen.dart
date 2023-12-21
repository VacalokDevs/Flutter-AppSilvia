import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/indicator_builder.dart';
import '../../models/comercio.dart';
import '../../widgets/back_button.dart';

class InfoComercioScreen extends StatefulWidget {
  final Comercio comercio;

  const InfoComercioScreen({Key? key, required this.comercio}) : super(key: key);

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

  Widget _buildHeader() {
    final List<Widget> headerItems = [];

    if (widget.comercio.direccion.isNotEmpty) {
      headerItems.add(
        GestureDetector(
          onTap: () async {
            final googleMapsUri = Uri.parse(widget.comercio.googleMapsLink);
            await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/images/iconos/Ubication-White.png',
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  widget.comercio.direccion,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Helvetica-Light',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (widget.comercio.telefono.isNotEmpty) {
      headerItems.add(const SizedBox(height: 15));
      headerItems.add(
        GestureDetector(
          onTap: () async {
            final whatsappUri = Uri.parse(widget.comercio.linkWhatsApp);
            await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/images/iconos/WhatsApp-White.png',
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.comercio.telefono,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Helvetica-Light',
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (widget.comercio.linkFacebook.isNotEmpty) {
      headerItems.add(const SizedBox(height: 15));
      headerItems.add(
        GestureDetector(
          onTap: () async {
            final facebookUri = Uri.parse(widget.comercio.linkFacebook);
            await launchUrl(facebookUri, mode: LaunchMode.externalApplication);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/images/iconos/Facebook-White.png',
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              
              Text(
                widget.comercio.nombre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Helvetica-Light',
                ),
              ),
              
            ],
          ),
        ),
      );
    }

    if (widget.comercio.linkInstagram.isNotEmpty) {
      headerItems.add(const SizedBox(height: 15));
      headerItems.add(
        GestureDetector(
          onTap: () async {
            final instagramUri = Uri.parse('https://instagram.com/${widget.comercio.linkInstagram}');
            await launchUrl(instagramUri, mode: LaunchMode.externalApplication);
          },
          child: Row(
            children: [
              Image.asset(
                'assets/images/iconos/Instagram-White.png',
                width: 35,
                height: 35,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                widget.comercio.linkInstagram,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Helvetica-Light',
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: headerItems,
    );
  }

  Widget _buildImageGallery() {
    return SingleChildScrollView(
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
              margin: const EdgeInsets.only(right: 15),
              height: MediaQuery.of(context).size.width / 4.6,
              width: MediaQuery.of(context).size.width / 4.1,
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
    );
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
                end: Alignment(0, -0.6),
                colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)],
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
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 45),
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
                            const SizedBox(
                              height: 50,
                            ),
                            Expanded(
                              child: Text(
                                widget.comercio.nombre,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontFamily: 'Helvetica-Bold',
                                ),
                              ),
                            ),
                          ],
                        ),
                        _buildHeader(),
                        const SizedBox(height: 30),
                        _buildImageGallery(),
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