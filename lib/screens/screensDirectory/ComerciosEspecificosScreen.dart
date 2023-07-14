import 'package:flutter/material.dart';
import '../../data/comercios_data.dart';
import '../../models/comercio.dart';
import 'InfoComercioScreen.dart';

class ListaComerciosEspecificosScreen extends StatefulWidget {
  final String tipoComercio;

  ListaComerciosEspecificosScreen({required this.tipoComercio});

  @override
  _ListaComerciosEspecificosScreenState createState() =>
      _ListaComerciosEspecificosScreenState();
}

class _ListaComerciosEspecificosScreenState
    extends State<ListaComerciosEspecificosScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  List<Comercio> comercios = [];
  int _focusedIndex = -1;
  Color _appBarColor =
      Color.fromARGB(255, 255, 255, 255); // Color predeterminado del AppBar

  void _navigateToInfoComercioScreen(Comercio comercio) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InfoComercioScreen(comercio: comercio),
      ),
    );
  }

  @override
  void initState() {
    _controller.addListener(onListenerController);
    comercios = ComerciosData.comercios
        .where((comercio) => comercio.tipo == widget.tipoComercio)
        .toList();
    // Establecer el color del AppBar como el color del primer comercio
    if (comercios.isNotEmpty) {
      _appBarColor = comercios[0].color;
    }
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
        title: Text(widget
            .tipoComercio), // Usar widget.tipoComercio para acceder al valor
        titleTextStyle: TextStyle(
          fontFamily: 'Helvetica-Bold',
          fontSize: 22,
        ),
        backgroundColor: _appBarColor,
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
            if (_focusedIndex != comercioIndex) {
              _setFocusedIndex(comercioIndex);
              _updateAppBarColor(comercio.color);
            }
            _navigateToInfoComercioScreen(comercio);
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

  void _updateAppBarColor(Color color) {
    setState(() {
      _appBarColor = color;
    });
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
          left: 0,
          top: MediaQuery.of(context).size.height * 0.004,
          bottom: MediaQuery.of(context).size.height * 0.004,
          right: 0),
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
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 12 * scale,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.5),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        comercio.nombre,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AnimatedContainer(
                        duration: animationDuration,
                        curve: Curves.fastEaseInToSlowEaseOut,
                        width: MediaQuery.of(context).size.width / 10 * scale,
                        height: MediaQuery.of(context).size.width / 10 * scale,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
