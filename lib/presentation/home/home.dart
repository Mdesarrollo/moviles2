import 'package:flutter/material.dart';
import 'package:otro/presentation/datos.dart';
import 'package:otro/presentation/form/form.dart';
import 'package:otro/presentation/widget/layaout/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indicador = 0;
  List<Widget> _elementos = <Widget>[
      FormScreen(),
      datosScreen(),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      body: _elementos.elementAt(_indicador),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indicador,
        onTap: (value) {
          setState(() {
            _indicador = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'FORM',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.dataset), label: 'DATOS'),
        ],
      ),
    );
  }
}
