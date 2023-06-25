import 'package:flutter/material.dart';

class MarcaSilviaScreen extends StatefulWidget {
  @override
  _MarcaSilviaScreenState createState() => _MarcaSilviaScreenState();
}

class _MarcaSilviaScreenState extends State<MarcaSilviaScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SectionData> _sections = [
    SectionData(
      title: 'Marca Silvia',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 1 - Descripción de la sección 1 - Descripción de la sección 1',
    ),
    SectionData(
      title: 'El Símbolo',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 2 - Descripción de la sección 2 - Descripción de la sección 2',
    ),
    SectionData(
      title: 'El Slogan',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 3 - Descripción de la sección 3 - Descripción de la sección 3',
    ),
    SectionData(
      title: '¿Cómo funciona?',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 4 - Descripción de la sección 4 - Descripción de la sección 4',
    ),
    SectionData(
      title: '¿Qué beneficios tiene la marca?',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 5 - Descripción de la sección 5 - Descripción de la sección 5',
    ),
    SectionData(
      title: '¿Qué implica?',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 6 - Descripción de la sección 6 - Descripción de la sección 6',
    ),
    SectionData(
      title: '¿Quién puede ser embajador?',
      imageUrl: 'assets/images/MarcaSilviaBG.jpg',
      description:
          'Descripción de la sección 7 - Descripción de la sección 7 - Descripción de la sección 7',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: _sections.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (BuildContext context, int index) {
                  SectionData section = _sections[index];
                  final titlePadding = EdgeInsets.symmetric(
                    horizontal: screenWidth / 4,
                  );
                  final descriptionPadding = EdgeInsets.symmetric(
                    horizontal: screenWidth / 8,
                    vertical: 10,
                  );

                  return Container(
                    key: ValueKey<int>(_currentIndex),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(section.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: titlePadding,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              section.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontFamily: 'Helvetica-Bold',
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Image.asset(
                            'assets/images/1.jpg',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: descriptionPadding,
                          child: Text(
                            section.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Helvetica-Light',
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildIndicator(screenWidth),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildIndicator(double screenWidth) {
    return List<Widget>.generate(_sections.length, (int index) {
      final isActive = _currentIndex == index;
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: isActive ? screenWidth / 30 : screenWidth / 50,
        height: isActive ? screenWidth / 30 : screenWidth / 50,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.grey[800] : Colors.grey[300],
        ),
      );
    });
  }
}

class SectionData {
  final String title;
  final String imageUrl;
  final String description;

  SectionData({
    required this.title,
    required this.imageUrl,
    required this.description,
  });
}
