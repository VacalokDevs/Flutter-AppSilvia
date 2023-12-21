import 'package:flutter/material.dart';
import '../data/event_data.dart'; // Asegúrate de importar los datos de eventos
import '../../BottomTabMenu.dart';
import '../models/eventModel.dart';
import 'event_specific_screen.dart'; // Asegúrate de importar los datos de eventos

class EventScreen extends StatefulWidget {
  const EventScreen({super.key, Key});

  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  int _focusedIndex = 0;
  final bool _showFirstEventRect =
      true; // Controla la visibilidad del primer evento como rectángulo

  @override
  void initState() {
    _controller.addListener(onListenerController);
    _focusedIndex = -1;
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
      body: Stack(
        children: [
          Column(
            children: [
              Visibility(
                visible:
                    _showFirstEventRect, // Mostrar el primer evento solo si está activado
                child: _buildFirstEventRect(),
              ),
              Expanded(
                child:
                    Container(), // Espacio vacío para empujar la lista hacia abajo
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.width*0.25,
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildEventsList(), // Lista de eventos
          ),
        ],
      ),
    );
  }

  // Construir la lista de eventos a partir del segundo evento
  Widget _buildEventsList() {
    return ListView.builder(
      controller: _controller,
      itemCount: EventData.events.length - 1,
      itemBuilder: (context, index) {
        final evento = EventData.events[index + 1];
        final isFocused = index == _focusedIndex;
        final scale = isFocused ? 1.8 : 1.0;
        final borderRadius =
            isFocused ? BorderRadius.circular(12) : BorderRadius.circular(12);

        return SizedBox(
          child: Align(
            heightFactor: 0.8,
            child: _AnimatedListItem(
              scale: scale,
              borderRadius: borderRadius,
              animationDuration: const Duration(milliseconds: 300),
              onTap: () async {
                if (!isFocused) {
                  _setFocusedIndex(index);
                  await Future.delayed(const Duration(milliseconds: 290));
                  _navigateToEventoEspecifico(context, evento);
                } else {
                  _navigateToEventoEspecifico(context, evento);
                }
              },
              evento: evento,
              isFocused: isFocused,
            ),
          ),
        );
      },
    );
  }

  void _setFocusedIndex(int index) {
    setState(() {
      _focusedIndex = _focusedIndex == index ? -1 : index;
    });
  }

  int _getFocusedIndex() {
    return _focusedIndex;
  }

  void _navigateToEventoEspecifico(BuildContext context, EventModel evento) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EventoEspecifico(eventModel: evento),
      ),
    );
  }

  // Nuevo widget para mostrar el primer evento como un rectángulo
  Widget _buildFirstEventRect() {
    final evento = EventData.events[0];

    return SizedBox(
      height: MediaQuery.of(context).size.height / 12 * 2.3,
      child: _AnimatedListItem(
        scale: 2.3, // Ajusta la escala a 2.3
        borderRadius: BorderRadius.circular(12),
        onTap: () => _navigateToEventoEspecifico(context, evento),
        evento: evento,
        isFocused: true, // No está enfocado
      ),
    );
  }
}

class _AnimatedBigItem extends StatelessWidget {
  final double scale;
  final BorderRadius borderRadius;
  final Duration animationDuration;
  final VoidCallback? onTap;
  final EventModel evento;

  const _AnimatedBigItem({
    required this.scale,
    required this.borderRadius,
    required this.evento,
    required this.animationDuration,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastEaseInToSlowEaseOut,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12 * scale,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 4,
                    spreadRadius: 4,
                    offset: Offset(4, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(evento.eventImage),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: borderRadius,
              child: CustomPaint(
                painter: _DiagonalPainter(color: evento.color),
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
                width: MediaQuery.of(context).size.width / 7,
                height: MediaQuery.of(context).size.width / 7,
                padding: const EdgeInsets.all(0),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double fontSizeNumber = constraints.maxHeight * 0.4;
                    final double fontSizeMonth = constraints.maxHeight * 0.12;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          evento.day.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeNumber,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        Positioned(
                          bottom: fontSizeMonth * 1.8,
                          child: Text(
                            evento.month,
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
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200), // Ajusta este valor según tu necesidad
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      evento.title,
                      textAlign: TextAlign.center, // Añade esta propiedad para centrar horizontalmente
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Helvetica-Bold',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedListItem extends StatelessWidget {
  final double scale;
  final BorderRadius borderRadius;
  final Duration animationDuration;
  final VoidCallback? onTap;
  final EventModel evento;
  final bool isFocused; // Estado de enfoque

  const _AnimatedListItem({
    required this.scale,
    required this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 150),
    this.onTap,
    required this.evento,
    required this.isFocused, // Recibe el estado de enfoque
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 0, bottom: 0, right: 0),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastEaseInToSlowEaseOut,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 12 * scale,
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black87,
                    blurRadius: 4,
                    spreadRadius: 4,
                    offset: Offset(4, 3),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(evento.eventImage),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: borderRadius,
              child: CustomPaint(
                painter: _DiagonalPainter(color: evento.color),
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
              bottom: isFocused
                  ? 2.5
                  : 4.5, // Ajusta estos valores para cambiar la separación vertical
              left: isFocused ? 5.5 : 7.5,
              child: AnimatedContainer(
                duration: animationDuration,
                curve: Curves.fastEaseInToSlowEaseOut,
                width: isFocused
                    ? MediaQuery.of(context).size.width / 4.5
                    : MediaQuery.of(context).size.width / 7.5,
                height: isFocused
                    ? MediaQuery.of(context).size.width / 4.5
                    : MediaQuery.of(context).size.width / 7.5,
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final double fontSizeNumber = constraints.maxHeight * 0.28;
                    final double fontSizeMonth = constraints.maxHeight * 0.115;

                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Text(
                          evento.day.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSizeNumber,
                            fontFamily: 'Helvetica-Bold',
                          ),
                        ),
                        Positioned(
                          bottom: fontSizeMonth *
                              2.2, // Ajusta este valor para cambiar la separación vertical
                          child: Text(
                            evento.month,
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
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200), // Ajusta este valor según tu necesidad
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      evento.title,
                      textAlign: TextAlign.center, // Añade esta propiedad para centrar horizontalmente
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Helvetica-Bold',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
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

void main() {
  runApp(
    MaterialApp(
      title: 'Directorio de Eventos',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const BottomTabMenu(),
    ),
  );
}
