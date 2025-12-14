import 'package:flutter/material.dart';
import 'package:otro/presentation/widget/layaout/drawer_widget.dart';
import 'package:otro/service/datosService.dart';
import 'package:otro/model/usuario.dart';
import 'package:go_router/go_router.dart';

// ignore: camel_case_types
class datosScreen extends StatelessWidget {
  static const name = "datos_screen";
  const datosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Estamos Mostrando Datos")),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/');
        },
        label: const Text("Ir al Home"),
      ),
      drawer: DrawerWidget(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.lightBlue, width: 2.0),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),

            padding: const EdgeInsets.all(20.0),
            child: FutureBuilder<List<Usuario>>(
              future: ApiService.getDatos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error al cargar datos"));
                }

                final usuarios = snapshot.data ?? [];

                if (usuarios.isEmpty) {
                  return const Center(child: Text("No hay datos registrados"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: usuarios.length,
                  itemBuilder: (context, index) {
                    final u = usuarios[index];

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        leading: const Icon(Icons.person, size: 40),
                        title: Text("${u.nombre} "),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email: ${u.email}"),
                            Text("Documento: ${u.documento}"),
                            Text("Sexo: ${u.sexo}"),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
