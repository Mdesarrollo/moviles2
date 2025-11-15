import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/presentation/widget/layaout/drawer_widget.dart';

// ignore: camel_case_types
class productosScreen extends StatelessWidget {
  static const name = "producto_screen";
  const productosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("estamos en productos"),),
      drawer: DrawerWidget(),
      body: FilledButton(
        onPressed: () {
          context.go("/");
        },
        child: Text("Este es un producto presione"),
      ),
    );
  }
}
