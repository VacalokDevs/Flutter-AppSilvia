import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/indicator_builder.dart';
import '../helpers/pantalla_noticia_navigator.dart';
import '../helpers/marca_silvia_navigator.dart';
import '../models/noticia.dart';
import '../../data/noticias_data.dart';
import 'screensNews/Noticia1Screen.dart';

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

Route _createRoute(Noticia noticia) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        Noticia1Screen(noticia: noticia),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      final curve = Curves.ease;
      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class _InicioScreenState extends State<InicioScreen> {
  List<Noticia> _noticias = NoticiasData.noticias;

  List<Widget> _buildIndicator() {
    return IndicatorBuilder.buildIndicator(_currentIndex, _noticias.length);
  }

  PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isButtonPressed = false;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _abrirPantallaNoticia(BuildContext context, Noticia noticia) {
    PantallaNoticiaNavigator.abrirPantallaNoticia(context, noticia);
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
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                Noticia noticia = _noticias[index];
                return GestureDetector(
                  onTap: () {
                    _abrirPantallaNoticia(context, noticia);
                  },
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null &&
                        details.primaryVelocity! < 0) {
                      _abrirPantallaNoticia(context, noticia);
                    }
                  },
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (BuildContext context, Widget? child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.7)).clamp(0.0, 1.0);
                      }
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
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
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: AssetImage(noticia.imagen),
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
                                      Colors.black.withOpacity(0.7),
                                      Colors.black.withOpacity(0.0)
                                    ],
                                    stops: [0.0, 0.5],
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
                                top: MediaQuery.of(context).size.height / 1.55,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 40, 0),
                                      child: AnimatedBuilder(
                                        animation: _pageController,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          double value = 1.0;
                                          if (_pageController
                                              .position.haveDimensions) {
                                            value = _pageController.page! -
                                                _currentIndex;
                                            value = (1 - (value.abs() * 3))
                                                .clamp(0.0, 1.0);
                                          }
                                          return Opacity(
                                            opacity: value,
                                            child: Transform.translate(
                                              offset:
                                                  Offset(0, (1 - value) * 100),
                                              child: child,
                                            ),
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            _noticias[_currentIndex].titulo,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontFamily: 'Helvetica-Bold',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 14, 40, 0),
                                      child: AnimatedBuilder(
                                        animation: _pageController,
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          double value = 1.0;
                                          if (_pageController
                                              .position.haveDimensions) {
                                            value = _pageController.page! -
                                                _currentIndex;
                                            value = (1 - (value.abs() * 3))
                                                .clamp(0.0, 1.0);
                                          }
                                          return Opacity(
                                            opacity: value,
                                            child: Transform.translate(
                                              offset:
                                                  Offset(0, (1 - value) * 100),
                                              child: child,
                                            ),
                                          );
                                        },
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            _noticias[_currentIndex]
                                                .descripcion,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Helvetica-Light',
                                            ),
                                          ),
                                        ),
                                      ),
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
              bottom: 16.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: MediaQuery.of(context).size.height / 24,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 4,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double fontSizeNumber =
                            constraints.maxHeight * 0.62;
                        final double fontSizeMonth =
                            constraints.maxHeight * 0.12;

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
                                DateFormat('MMMM', 'es_ES')
                                    .format(DateTime.now())
                                    .toUpperCase(),
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
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: GestureDetector(
                  onTap: () {
                    MarcaSilviaNavigator.abrirMarcaSilvia(context);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 5),
                    width: 102,
                    height: 88,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 6,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: _isButtonPressed
                        ? Image.asset(
                            'assets/images/resourcesMarcaSilvia/MarcaSilvia-Boton.png',
                            height: 18,
                            width: 18,
                          )
                        : Image.asset(
                            'assets/images/resourcesMarcaSilvia/MarcaSilvia-Boton.png',
                            height: 24,
                            width: 24,
                          ),
                  ),
                ),
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
