import 'package:flutter/material.dart';
import '../../data/tipos_comercios_data.dart';
import '../../models/tipo_comercio.dart';
import 'screensRestaurantes/MenuRestaurantesScreen.dart';

class ComerciosEspecificosScreen extends StatelessWidget {
  final String tipoComercio;

  ComerciosEspecificosScreen({required this.tipoComercio});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comercios - $tipoComercio'),
      ),
      body: Center(
        child: Text('Lista de comercios $tipoComercio'),
      ),
    );
  }
}

class DirectorioScreen extends StatefulWidget {
  @override
  _DirectorioScreenState createState() => _DirectorioScreenState();
}

class _DirectorioScreenState extends State<DirectorioScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<TipoComercio> tiposComercio = TiposComercioData.tiposComercio;
  int _focusedIndex = -1;

  @override
  void initState() {
    _controller.addListener(onListenerController);
    tiposComercio = TiposComercioData.tiposComercio;
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(onListenerController);
    super.dispose();
  }

  void onListenerController() {
    setState(() {
      _focusedIndex = _getFocusedIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Directorio - Comercios'),
      ), */
      body: Column(
        children: [
          _buildEmergenciaWidget(),
          Expanded(child: _buildComerciosList()),
        ],
      ),
    );
  }

  Widget _buildEmergenciaWidget() {
    return GestureDetector(
      onTap: () {
        _navigateToContactosEmergencia(context);
      },
      child: _AnimatedListItem(
        tipoComercio: tiposComercio[0],
        scale: 1.8,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _buildComerciosList() {
    return ListView.builder(
      controller: _controller,
      itemCount:
          tiposComercio.length - 1, // Restar 1 al número total de elementos
      itemBuilder: (context, index) {
        final comercio = tiposComercio[index + 1]; // Ajustar el índice
        final isFocused = index == _focusedIndex;
        final scale = isFocused ? 1.8 : 1.0;
        final borderRadius =
            isFocused ? BorderRadius.circular(16) : BorderRadius.circular(12);

        return GestureDetector(
          onTap: () {
            final comercioIndex = index; // Ajustar el índice
            if (_focusedIndex == comercioIndex) {
              _navigateToComerciosEspecificos(context, comercio.tipo);
            } else {
              _scrollToIndex(comercioIndex);
              _setFocusedIndex(comercioIndex);
            }
          },
          child: _AnimatedListItem(
            tipoComercio: comercio, // Pasar el comercio correspondiente
            scale: scale,
            borderRadius: borderRadius,
            animationDuration: Duration(milliseconds: 500),
          ),
        );
      },
    );
  }

  void _scrollToIndex(int index) {
    final scrollPosition = index * 100.0;
    final centerPosition = MediaQuery.of(context).size.height / 2;
    _controller.animateTo(
      scrollPosition - centerPosition,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  void _setFocusedIndex(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  int _getFocusedIndex() {
    final centerPosition = MediaQuery.of(context).size.height / 2;
    int focusedIndex = -1;
    double minDistance = double.infinity;

    for (int i = 0; i < tiposComercio.length; i++) {
      final itemOffset = i * 100.0;
      final distance = (_controller.offset + centerPosition - itemOffset).abs();
      if (distance < minDistance) {
        minDistance = distance;
        focusedIndex = i;
      }
    }

    return focusedIndex;
  }

  void _navigateToComerciosEspecificos(
      BuildContext context, String tipoComercio) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MenuRestaurantesScreen(),
      ),
    );
  }

  void _navigateToContactosEmergencia(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactosEmergenciaScreen(),
      ),
    );
  }
}

class _DiagonalPainter extends CustomPainter {
  final Color color;

  _DiagonalPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width - (size.width / 8), size.height * 0.0);
    path.lineTo(0, size.height * (size.height / 32));
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiagonalPainter oldPainter) {
    return oldPainter.color != color;
  }
}

class _AnimatedListItem extends StatelessWidget {
  final TipoComercio tipoComercio;
  final double scale;
  final BorderRadius borderRadius;
  final Duration animationDuration;

  _AnimatedListItem({
    required this.tipoComercio,
    required this.scale,
    required this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 150),
  });

  bool isSelected = false; // Variable para indicar el estado de selecci

  @override
  Widget build(BuildContext context) {
    if (scale > 1) {
      isSelected = true;
    }

    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.height * 0.008,
          bottom: MediaQuery.of(context).size.height * 0.008,
          right: MediaQuery.of(context).size.width * 0.02),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: animationDuration,
            curve: Curves.fastEaseInToSlowEaseOut,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 12 * scale,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(1, 3),
                ),
              ],
              image: DecorationImage(
                image: AssetImage(tipoComercio.tipoImagen),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.dstATop,
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: borderRadius,
            child: CustomPaint(
              painter: _DiagonalPainter(color: tipoComercio.color),
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.fastEaseInToSlowEaseOut,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 12 * scale,
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 15,
            child: AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastEaseInToSlowEaseOut,
              width: isSelected ? MediaQuery.of(context).size.width / 7 : 30,
              height: isSelected ? MediaQuery.of(context).size.width / 7 : 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(tipoComercio.icono),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                tipoComercio.tipo,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Helvetica-Bold',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactosEmergenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos de Emergencia'),
      ),
      body: Center(
        child: Text('Lista de contactos de emergencia'),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directorio de Comercios',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: DirectorioScreen(),
    );
  }
}
