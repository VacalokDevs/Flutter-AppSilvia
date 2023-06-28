import 'package:flutter/material.dart';
import '../../models/noticia.dart';
import '../../helpers/indicator_builder.dart';

class Noticia2Screen extends StatefulWidget {
  final Noticia noticia;

  Noticia2Screen({required this.noticia});

  @override
  _Noticia2ScreenState createState() => _Noticia2ScreenState();
}

class _Noticia2ScreenState extends State<Noticia2Screen> {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              widget.noticia.imagen,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.75),
              colorBlendMode: BlendMode.darken,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenHeight * 0.12,
              ),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.noticia.imagenesRelacionadas.length + 1,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    // Primera sección: Título y texto completo
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 0),
                        Text(
                          widget.noticia.titulo,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              widget.noticia.textoCompleto,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Helvetica-Light',
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    // Imágenes
                    final int imageIndex = index - 1;
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(
                              '${widget.noticia.imagenesRelacionadas[imageIndex]}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: IndicatorBuilder.buildIndicator(_currentPageIndex,
                    widget.noticia.imagenesRelacionadas.length + 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
