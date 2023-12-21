import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatelessWidget {
  final Widget? child;

  const SplashScreen({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => child!),
        );
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Fondo de bienvenida
              Positioned(
                top: MediaQuery.of(context).size.height / 6,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Image.asset(
                    'assets/images/splash/bienvenido.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Texto animado en el centro
              Positioned(
                bottom: MediaQuery.of(context).size.height / 2.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => child!),
                        );
                      },
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            "¡Toca la pantalla para continuar!",
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica-Light',
                            ),
                            textAlign: TextAlign.center,
                            speed: Duration(milliseconds: 50),
                          ),
                        ],
                        pause: Duration(milliseconds: 2000),
                      ),
                    ),
                  ],
                ),
              ),
              // Nuevo texto "Corporación Cultural Vacalok"
              Positioned(
                top: MediaQuery.of(context).size.height / 1.8, // Ajusta la posición vertical según tus necesidades
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'CORPORACIÓN CULTURAL',
                        style: TextStyle(
                          fontSize: 14,
                            fontFamily: 'Helvetica-Cond',
                        ),
                      ),
                      Text(
                        'VACALOK',
                        style: TextStyle(
                          fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica-Cond',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Información "Desarrollado por" en la parte inferior
              Positioned(
                bottom: 0,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Desarrollado por: ',
                          style: TextStyle(
                            fontSize: 13,
                            //fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica-Cond',
                          ),
                        ),
                        Text(
                          'Hermanos Burbano',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica-Cond',
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/splash/B_icon.png',
                      width: 72,
                      height: 72,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
