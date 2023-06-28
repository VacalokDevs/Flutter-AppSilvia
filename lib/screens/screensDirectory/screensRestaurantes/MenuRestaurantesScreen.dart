import 'package:flutter/material.dart';
import '../../../data/comercios_data.dart';
import '../../../models/comercio.dart';

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

class MenuRestaurantesScreen extends StatefulWidget {
  @override
  _MenuRestaurantesScreenState createState() => _MenuRestaurantesScreenState();
}

class _MenuRestaurantesScreenState extends State<MenuRestaurantesScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  List<Comercio> comercios = ComerciosData.comercios;
  int _focusedIndex = -1;

  @override
  void initState() {
    _controller.addListener(onListenerController);
    comercios = ComerciosData.comercios
        .where((comercio) => comercio.tipo == 'Restaurantes')
        .toList();
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
      appBar: AppBar(
        title: Text('Restaurantes'),
        titleTextStyle: TextStyle(
          fontFamily: 'Helvetica-Bold',
          fontSize: 22,
        ),
        backgroundColor: Color.fromARGB(255, 253, 148, 29),
      ),
      body: Column(
        children: [
          Expanded(child: _buildComerciosList()),
        ],
      ),
    );
  }

  Widget _buildComerciosList() {
    return ListView.builder(
      controller: _controller,
      itemCount: comercios.length,
      itemBuilder: (context, index) {
        final comercio = comercios[index];
        final isFocused = index == _focusedIndex;
        final scale = isFocused ? 1.8 : 1.0;
        final borderRadius =
            isFocused ? BorderRadius.circular(16) : BorderRadius.circular(12);

        return GestureDetector(
          onTap: () {
            final comercioIndex = index;
            if (_focusedIndex == comercioIndex) {
              _navigateToComerciosEspecificos(context, comercio.nombre);
            } else {
              _setFocusedIndex(comercioIndex);
            }
          },
          child: _AnimatedListItem(
            comercio: comercio,
            scale: scale,
            borderRadius: borderRadius,
            animationDuration: Duration(milliseconds: 500),
          ),
        );
      },
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

    for (int i = 0; i < comercios.length; i++) {
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
        builder: (context) => ComerciosEspecificosScreen(
          tipoComercio: tipoComercio,
        ),
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
    path.lineTo(size.width - (size.width / 2), size.height * 0.0);
    path.lineTo(0, size.height * (size.height / 20));
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DiagonalPainter oldPainter) {
    return oldPainter.color != color;
  }
}

class _AnimatedListItem extends StatelessWidget {
  final Comercio comercio;
  final double scale;
  final BorderRadius borderRadius;
  final Duration animationDuration;

  _AnimatedListItem({
    required this.comercio,
    required this.scale,
    required this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 150),
  });

  bool isSelected = false; // Variable para indicar el estado de selección

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
                image: AssetImage(comercio.imagenComercio),
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
              painter: _DiagonalPainter(color: comercio.color),
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.fastEaseInToSlowEaseOut,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 11.5 * scale,
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
                child: Image.asset(comercio.icono),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                comercio.nombre,
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

void main() {
  runApp(MaterialApp(
    home: MenuRestaurantesScreen(),
  ));
}
