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
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_MarcaSilvia.png',
      description:
          'Es un sistema de identidad diseñado por la Corporación Cultural Vacalok, con el fin de agremiar, identificar, apoyar y proyectar a todos los agentes artisticos, culturales, deportivos, comerciales y de otros sectores, pertenenclentes al municpio de Silvia, asi como también, constituye el mecanismo visual mediante el cuál se pretende posicionar esta hermosa localidad Caucana a nivel mundial como un mágico lugar para conocer y visitar una y mil veces, gracias a todas sus características.',
      width: 0.4, // Ancho personalizado para la primera sección
      height: 0.4, // Alto personalizado para la primera sección
    ),
    SectionData(
      title: 'El Símbolo',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Simbolo.png',
      imageItem2: 'assets/images/resourcesMarcaSilvia/mS_Simbolos.svg.png',
      description:
          'Es la mezcla perfecta entre la inicial de Silvia, el sentido de pertenencia. por lo que somos, represententado en un corazón, la fauna visualizada en un colibrí típico del municipio y una hoja que simboliza nuetra riqueza natural en cuanto a flora se refiere. La pieza se tiñe con el verde de nuestro paisaje, el azul de nuestras aguas, el violeta de nuestras tradiciones y el naranja de nuestra alegria y calor humano.',
      width: 0.3, // Ancho personalizado para la segunda sección
      height: 0.3, // Alto personalizado para la segunda sección
    ),
    SectionData(
      title: 'El Slogan',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Slogan.svg.png',
      description:
          'Es la descripción textual de lo que es el municipio de Silvia en materia cultural, gracias a su amplio abanico en este aspecto, compuesto por 4 comunidades indigenas; Kishú, Nasa, Ampiuile, y Misak, dos comunidades indigenas como los son Usenda y Santa Lucia y la zona urbana, convirtiendose de este modo, en uno de los 3 municipios con mayor diversidad indignea de Colombia.',
      width: 0.1, // Ancho personalizado para la tercera sección
      height: 0.1, // Alto personalizado para la tercera sección
    ),
    SectionData(
      title: '¿Cómo Funciona?',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Identifier.png',
      description:
          'La marca constituye un indentificador que agremia un selecto grupo de embajadores (organizaciones, instituciones, entidades y personas) con un fin común, representar de manera ética y responsable al municipio de Silvia a través de sus propias actividades, (artisticas, comerciales, culturales, entre otras) mientras potencia los valores pluriculturales y naturales Silvianos para su equitativo reconocimiento y/o proyección a nivel local, regional, nacional e internacional.',
      width: 0.3, // Ancho personalizado para la segunda sección
      height: 0.3, // Alto personalizado para la segunda sección
    ),
    SectionData(
      title: '¿Qué beneficios tiene la marca?',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Profits.png',
      description:
          'La marca en si, denota un certificado de excelencia, es un standar de calidad, todo aquel que tenga la posibilidad de convertirse en embajador de la marca, es porque ha cumplido con unos requisitos minimos exigidos que garantizan, no sólo un buen servicio, sino una buena, ética y responsable practica en su labor. Así mismo, obtendrá diversos beneficios de apoyo, reconocimiento y proyección en las diferentes plataformas implementadas por el proyecto Marca Silvia permitiéndole su crecimiento y posicionamiento a nivel local, regional, nacional e internacional.',
      width: 0.3, // Ancho personalizado para la primera sección
      height: 0.3, // Alto personalizado para la primera sección
    ),
    SectionData(
      title: '¿Qué implica?',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Alert.svg.png',
      description:
          'Todos los socios de la marca Silvia, están obligados a ejercer buenas y éticas practicas en sus actividades para la pervalencia del buen nombre de Silvia, así como también velar por la conservación y proyección de todos los valores pluriculturales y naturales del municipio, todo lo anterior, conlleva a un alto nivel de sentido de pertenencia, caracteristica fundamental de todo aquel que quiera portar dicha marca.',
      width: 0.3, // Ancho personalizado para la primera sección
      height: 0.3, // Alto personalizado para la primera sección
    ),
    SectionData(
      title: '¿Quién puede ser embajador?',
      imageBG: 'assets/images/MarcaSilviaBG.jpg',
      imageItem: 'assets/images/resourcesMarcaSilvia/mS_Ambassador.png',
      description:
          'Cualquier persona, institución, entidad u organización, de carácter público y/o privado, Silviano o no que pueda demostrar con hechos su sentido de pertenencia, buenas prácticas en su labor y profundo respeto por el muncipio y su identidad podrá solicitar la cobertura de la marca Silvia y hacer parte de nuestra base de datos, siempre y cuando cumpla con las politicas de uso e implementación de la misma.',
      width: 0.3, // Ancho personalizado para la primera sección
      height: 0.3, // Alto personalizado para la primera sección
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

    return SafeArea(
      child: Scaffold(
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
                      horizontal: screenWidth / 5,
                    );
                    final descriptionPadding = EdgeInsets.symmetric(
                      horizontal: screenWidth / 9,
                      vertical: 0,
                    );

                    return Container(
                      key: ValueKey<int>(_currentIndex),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(section.imageBG),
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
                          SizedBox(height: 20),
                          Wrap(
                            alignment: WrapAlignment.center,
                            children: [
                              Container(
                                width: double.infinity,
                                child: IntrinsicWidth(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Image.asset(
                                        section.imageItem,
                                        height: section.height * screenWidth,
                                      ),
                                      if (section.imageItem2 != null)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 0,
                                          ),
                                          child: Image.asset(
                                            section.imageItem2!,
                                            width:
                                                descriptionPadding.horizontal *
                                                    6,
                                            height: 100,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: descriptionPadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  section.description,
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    letterSpacing: 0.8,
                                    wordSpacing: 1.8,
                                    fontFamily: 'Helvetica-Light',
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
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
  final String imageBG;
  final String imageItem;
  final String? imageItem2;
  final String description;
  final double width;
  final double height;

  SectionData({
    required this.title,
    required this.imageBG,
    required this.imageItem,
    this.imageItem2,
    required this.description,
    required this.width,
    required this.height,
  });
}
