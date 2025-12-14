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
          SizedBox(height: 50),
          Icon(Icons.person),
          SizedBox(height: 20),
          Text("192125-MAICOL EDUARDO ROBLES SALAZAR"),
          Text("merobless@ufpso.edu.co"),
          SizedBox(height: 20),
          Text("192091-JESUS EMILIO OSORIO PEREZ"),
          Text("jeosoriop@ufpso.edu.co"),
          SizedBox(height: 20),
          ...routerList
              .where((e) => e.isVisible)
              .map(
                (e) => ListTile(
                  title: Text(e.title),
                  onTap: () {
                    Navigator.pop(context);
                    context.go(e.patch);
                  },
                  leading: Icon(e.icon),
                ),
              ),
        ],
      ),
    );
  }
}
