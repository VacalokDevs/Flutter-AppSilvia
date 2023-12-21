import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/indicator_builder.dart';
import '../helpers/marca_silvia_navigator.dart';
import '../models/noticia.dart';
import '../../data/noticias_data.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  final List<Noticia> _noticias = NoticiasData.noticias;
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages =
        _noticias.map((noticia) => noticia.backgroundImage).toList();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _buildIndicator() {
    return IndicatorBuilder.buildIndicator(_currentIndex, _noticias.length);
  }

  Widget _buildBrandSilviaButton(double scaleFactor) {
    return Transform.scale(
      scale: scaleFactor,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Image.asset(
          'assets/images/resourcesMarcaSilvia/MarcaSilvia-Boton.png',
          height: MediaQuery.of(context).size.width * 0.35,
          width: MediaQuery.of(context).size.width * 0.35,
        ),
      ),
    );
  }

    Widget _buildDateWidget(double fontSizeNumber, double fontSizeMonth) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Text(
            DateFormat('d').format(DateTime.now()),
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSizeNumber,
              fontFamily: 'Helvetica-Bold',
            ),
          ),
          Positioned(
            bottom: fontSizeMonth * 0.8,
            child: Text(
              DateFormat('MMMM', 'es_ES').format(DateTime.now()).toUpperCase(),
              style: TextStyle(
                letterSpacing: 0.5,
                color: Colors.white,
                fontSize: fontSizeMonth,
                fontFamily: 'Helvetica-Bold',
              ),
            ),
          ),
        ],
      );
    }

    Widget _buildOpacityTranslateImages(
      double value,
      BuildContext context,
      List<String> images,
      int index, // Agregamos el parámetro index
    ) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          0,
          MediaQuery.of(context).size.width * 0.08,
          0,
        ),
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 100),
                child: child,
              ),
            );
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: images.map((imagen) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _backgroundImages[index] = imagen;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
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
          ),
        ),
      );
    }

    Widget _buildOpacityTranslateText(
      double value,
      String text,
      double fontSize,
      String fontFamily,
    ) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          MediaQuery.of(context).size.width * 0.08,
          0,
          MediaQuery.of(context).size.width * 0.08,
          fontSize == 28 ? 5 : 10,
        ),
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (BuildContext context, Widget? child) {
            return Opacity(
              opacity: value,
              child: Transform.translate(
                offset: Offset(0, (1 - value) * 100),
                child: child,
              ),
            );
          },
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ),
            ),
          ),
        ),
      );
    }

  final PageController _pageController = PageController();
  bool _isButtonPressed = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_currentIndex == 0 ? 0 : 25),
          topRight: Radius.circular(_currentIndex == 0 ? 0 : 25),
        ),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _noticias.length,
              onPageChanged: onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (BuildContext context, Widget? child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.4)).clamp(0.5, 2.0);
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Transform.scale(
                          scale: Curves.easeOut.transform(value),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(_backgroundImages[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              ShaderMask(
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.75),
                                      Colors.black.withOpacity(0.0)
                                    ],
                                    stops: const [0.0, 0.6],
                                  ).createShader(bounds);
                                },
                                blendMode: BlendMode.dstIn,
                                child: Container(
                                  color: Colors.black,
                                ),
                              ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: MediaQuery.of(context).size.height / 18,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildOpacityTranslateText(
                                      value,
                                      _noticias[_currentIndex].titulo,
                                      28,
                                      'Helvetica-Bold',
                                    ),
                                    _buildOpacityTranslateText(
                                      value,
                                      _noticias[_currentIndex].descripcion,
                                      16,
                                      'Helvetica-Light',
                                    ),
                                    _buildOpacityTranslateImages(
                                      value,
                                      context,
                                      _noticias[_currentIndex].imagenesRelacionadas,
                                      _currentIndex, // Agrega el índice aquí
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height / 55,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
          SafeArea(
  child: Stack(
    children: [
      Positioned(
        top: 0,
        left: MediaQuery.of(context).size.width * 0.08,
        child: SizedBox(
          width: 82,
          height: 68,
          child: InkWell(
            onTap: () {
              MarcaSilviaNavigator.abrirMarcaSilvia(context);
            },
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(0),
              child: Center(
                child: _buildBrandSilviaButton(2),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 68, // Altura del primer elemento
        right: MediaQuery.of(context).size.width * 0.08,
        child: SizedBox(
          height: MediaQuery.of(context).size.width / 5.5,
          width: MediaQuery.of(context).size.width / 5.5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.27),
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.all(0),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double fontSizeNumber = constraints.maxHeight * 0.62;
                final double fontSizeMonth = constraints.maxHeight * 0.13;
                return _buildDateWidget(fontSizeNumber, fontSizeMonth);
              },
            ),
          ),
        ),
      ),
    ],
  ),
),




            if (_isButtonPressed)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isButtonPressed = false;
                    });
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
