import 'package:flutter/material.dart';
import '../models/place.dart'; // Importa la definición de Place desde models/place.dart
import '../data/place_data.dart'; // Importa la definición de Place desde models/place.dart
import 'DeInterestDetails.dart';

class DeInteresScreen extends StatefulWidget {
  const DeInteresScreen({Key? key}) : super(key: key);

  @override
  _DeInteresScreenState createState() => _DeInteresScreenState();
}

class _DeInteresScreenState extends State<DeInteresScreen> {
  List<Place> places =
      placesData; // Usar la lista de lugares de place_data.dart

  void _navigateToDeInteresDetails(Place place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeInteresDetails(place: place),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0), // Espacio vertical
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 10, // Espacio vertical entre cuadros
            crossAxisSpacing: 10, // Espacio horizontal entre cuadros
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 20), // Espacio entre recuadros y los lados
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return GestureDetector(
              onTap: () => _navigateToDeInteresDetails(place),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(12),
                        ),
                        child: Image.asset(
                          place.imagenLugar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          fit: BoxFit
                              .scaleDown, // Ajusta el texto al espacio disponible
                          child: Text(
                            place.nombre,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: 'Helvetica-Bold',
                            ),
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
    ),);
  }
}
