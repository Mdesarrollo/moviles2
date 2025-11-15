import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  static const name = "layput";
  final Widget child;
  const Layout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Soy Admin y me la pelan")),
      body: SafeArea(
        child: Column(
          children: [
            Text("Esto es una maqueta abajo del contenido"),
            child,
            Text("Final contenido"),
          ],
        ),
      ),
    );
  }
}
