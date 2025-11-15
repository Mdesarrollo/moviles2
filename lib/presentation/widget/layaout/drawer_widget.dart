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
