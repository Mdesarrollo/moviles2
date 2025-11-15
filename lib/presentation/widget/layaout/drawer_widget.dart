import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/config/router/router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final routerList = routerConfig;
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(child: Text("hola desde drawer")),
          
          ...routerList
              .where((e) => e.isVisible)
              .map(
                (e) => ListTile(
                  title: Text(e.title),
                  subtitle: Text(e.description),
                  onTap: () {
                    Navigator.pop(context);
                    GoRouter.of(context).push("/");
                    // context.go("/");
                  },
                  leading: Icon(e.icon),
                ),
              ),
        ],
      ),
    );
  }
}
