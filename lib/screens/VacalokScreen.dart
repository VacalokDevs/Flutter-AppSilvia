import 'package:flutter/material.dart';
import '../data/vacalok_data.dart';
import 'VacalokDetails.dart';
import '../models/vacalok.dart';

class VacalokScreen extends StatefulWidget {
  const VacalokScreen({Key? key}) : super(key: key);

  @override
  _VacalokScreenState createState() => _VacalokScreenState();
}

class _VacalokScreenState extends State<VacalokScreen> {
  List<Vacalok> vacaloks = vacalokData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
        child: Column(
          children: [
            // Primer elemento aparte
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => VacalokDetails(vacalok: vacaloks[0]),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 120, // Altura deseada
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.asset(
                              vacaloks[0].imagen, // Imagen del primer elemento
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            vacaloks[0].nombre, // Nombre del primer elemento
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica-Bold',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 8, // Ajustar posición izquierda del icono
                      top: 8, // Ajustar posición superior del icono
                      child: Image.asset(
                        vacaloks[0].icono, // Icono del primer elemento
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Espacio vertical entre elementos
            const SizedBox(height: 10),
            // Resto de elementos del grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: vacaloks.length - 1, // Excluye el primer elemento
                itemBuilder: (context, index) {
                  final vacalok =
                      vacaloks[index + 1]; // Empieza desde el segundo elemento
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              VacalokDetails(vacalok: vacalok),
                        ),
                      );
                      // Acción cuando se toca un elemento del grid
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.asset(
                                      vacalok.imagen,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left:
                                      8, // Ajustar posición izquierda de la imagen
                                  top:
                                      8, // Ajustar posición superior de la imagen
                                  child: Image.asset(
                                    vacalok.icono, // Icono del elemento
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Text(
                                vacalok.nombre,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Helvetica-Bold',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
