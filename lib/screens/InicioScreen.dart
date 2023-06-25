import 'package:appsilvia/screens/MarcaSilviaScreen.dart';
import 'package:flutter/material.dart';

class InicioScreen extends StatefulWidget {
  @override
  _InicioScreenState createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  List<Noticia> _noticias = [
    Noticia(
      imagen: 'assets/images/1.jpg',
      titulo: 'Lago Chimán',
      descripcion:
          'Descripción de la Noticia 1 - Descripción de la Noticia 1 - Descripción de la Noticia 1 - Descripción de la Noticia 1',
    ),
    Noticia(
      imagen: 'assets/images/1.jpg',
      titulo: 'Semana Santa 2023',
      descripcion: 'Descripción de la Noticia 2',
    ),
    Noticia(
      imagen: 'assets/images/1.jpg',
      titulo: 'Nuestro Patrimonio',
      descripcion: 'Descripción de la Noticia 3',
    ),
  ];

  PageController _pageController = PageController();
  int _currentIndex = 0;

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
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                Noticia noticia = _noticias[index];
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (BuildContext context, Widget? child) {
                    double value = 1.0;
                    if (_pageController.position.haveDimensions) {
                      value = _pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
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
                          ],
                        ),
                      ),
                    );
                  },
                  child: Container(
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
                );
              },
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                    child: AnimatedBuilder(
                      animation: _pageController,
                      builder: (BuildContext context, Widget? child) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - _currentIndex;
                          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                        }
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 30),
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
                            fontSize: 32,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 14),
                    child: AnimatedBuilder(
                      animation: _pageController,
                      builder: (BuildContext context, Widget? child) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - _currentIndex;
                          value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                        }
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, (1 - value) * 40),
                            child: child,
                          ),
                        );
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _noticias[_currentIndex].descripcion,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Helvetica-Light',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 40,
              top: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MarcaSilviaScreen()),
                  );
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  width: _isButtonPressed ? 100 : 102,
                  height: _isButtonPressed ? 85 : 88,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Icon(
                    Icons.home_max_outlined,
                    color: Colors.orange,
                    size: _isButtonPressed ? 18 : 24,
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
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          setState(() {
                            _isButtonPressed = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    return List<Widget>.generate(_noticias.length, (int index) {
      final isActive = _currentIndex == index;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isActive ? 14 : 9,
        height: isActive ? 14 : 9,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.grey,
        ),
      );
    });
  }
}

class Noticia {
  final String imagen;
  final String titulo;
  final String descripcion;

  Noticia({
    required this.imagen,
    required this.titulo,
    required this.descripcion,
  });
}
