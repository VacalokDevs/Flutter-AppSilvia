import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../helpers/indicator_builder.dart';
import '../../helpers/marca_silvia_navigator.dart';
import '../../models/comercio.dart';
import '../../data/comercios_data.dart';

class InfoComercioScreen extends StatefulWidget {
  @override
  _InfoComercioScreenState createState() => _InfoComercioScreenState();
}

class _InfoComercioScreenState extends State<InfoComercioScreen> {
   List<Comercio> comercios = [];
  late List<String> _backgroundImages;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _backgroundImages =
        _comercios.map((comercio) => comercio.).toList();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> _buildIndicator() {
    return IndicatorBuilder.buildIndicator(_currentIndex, _noticias.length);
  }

  PageController _pageController = PageController();
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
                  onTap: () {
                    // Acción al hacer clic en la noticia
                  },
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity != null &&
                        details.primaryVelocity! < 0) {
                      // Acción al hacer un deslizamiento vertical hacia arriba en la noticia
                    }
                  },
                  child: AnimatedBuilder(
                    animation: _pageController,
                    builder: (BuildContext context, Widget? child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = _pageController.page! - index;
                        value = (1 - (value.abs() * 0.4)).clamp(0.5, 2.0);
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
                                    stops: [0.0, 0.6],
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        5,
                                      ),
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
                                      padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        10,
                                      ),
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        0,
                                        MediaQuery.of(context).size.width *
                                            0.08,
                                        0,
                                      ),
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
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: _noticias[_currentIndex]
                                                .imagenesRelacionadas
                                                .map((imagen) {
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _backgroundImages[index] =
                                                        imagen;
                                                  });
                                                },
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      right: 10),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4.6,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4.1,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
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
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * (0.08),
                  vertical: MediaQuery.of(context).size.height / 10,
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width / 4.7,
                  width: MediaQuery.of(context).size.width / 4.7,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.27),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: EdgeInsets.all(0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double fontSizeNumber =
                            constraints.maxHeight * 0.62;
                        final double fontSizeMonth =
                            constraints.maxHeight * 0.13;

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
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * (0.08)),
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
                    padding: EdgeInsets.all(0),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        final double scaleFactor = constraints.maxWidth / 64;

                        return Transform.scale(
                          scale: scaleFactor,
                          child: Container(
                            padding: EdgeInsets.all(16),
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
                        );
                      },
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
