import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/config/user_session.dart';
import 'package:otro/presentation/widget/layaout/drawer_widget.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = "profile_screen";
  
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mi Perfil")),
      drawer: const DrawerWidget(), // Para que tenga el menú lateral
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  _infoItem(Icons.badge, "Nombre", UserSession.nombre ?? "Desconocido"),
                  
                  const SizedBox(height: 20),
                  _infoItem(Icons.email, "Correo", UserSession.email ?? "Desconocido"),
  
                  const SizedBox(height: 30),
                  FilledButton.icon(
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      UserSession.clear(); 
                      context.go('/login'); 
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Cerrar Sesión"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueGrey, size: 30),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        )
      ],
    );
  }
}