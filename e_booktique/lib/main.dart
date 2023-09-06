import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade800,
          title: const Text('E-BookTique'),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Inicio",
              icon: Icon(FontAwesomeIcons.houseChimneyCrack),
            ),
            BottomNavigationBarItem(
              label: "Favoritos",
              icon: Icon(FontAwesomeIcons.heart),
            ),
            BottomNavigationBarItem(
              label: "Perfil",
              icon: Icon(FontAwesomeIcons.userTie),
            ),
          ],
        ),
      ),
    );
  }
}
