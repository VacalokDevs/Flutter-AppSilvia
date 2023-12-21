import 'package:flutter/material.dart';
import 'screens/InicioScreen.dart';
import 'screens/screensDirectory/DirectorioScreen.dart';
import 'screens/EventScreen.dart';
import 'screens/DeInteresScreen.dart';
import 'screens/VacalokScreen.dart';
import 'helpers/flutterfont.dart';

class BottomTabMenu extends StatefulWidget {
  const BottomTabMenu({super.key});

  @override
  _BottomTabMenuState createState() => _BottomTabMenuState();
}

class _BottomTabMenuState extends State<BottomTabMenu> {
  int _currentIndex = 0;
  final double _selectedIconSize = 28.0;
  final double _unselectedIconSize = 24.0;
  final List<Widget> _screens = [
    const InicioScreen(),
    const DirectorioScreen(),
    const EventScreen(),
    const DeInteresScreen(),
    const VacalokScreen(),
  ];

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: _currentIndex == index ? _selectedIconSize : _unselectedIconSize,
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF0069A5),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: [
            _buildBottomNavigationBarItem(
                FlutterFontIcons.AppSilviaInicio, 'Inicio', 0),
            _buildBottomNavigationBarItem(
                FlutterFontIcons.AppSilviaDirectorio, 'Directorio', 1),
            _buildBottomNavigationBarItem(
                FlutterFontIcons.AppSilviaCalendario, 'Eventos', 2),
            _buildBottomNavigationBarItem(
                FlutterFontIcons.AppSilviaDeInteres, 'De Interés', 3),
            _buildBottomNavigationBarItem(
                FlutterFontIcons.AppSilviaVacalok, 'Vacalok', 4),
          ],
        ),
      ),
    );
  }
}
