import 'package:flutter/material.dart';
import 'package:otro/model/usuario.dart';
import 'package:otro/presentation/widget/layaout/drawer_widget.dart';
import 'package:otro/service/datosService.dart';

// ignore: must_be_immutable
class FormScreen extends StatefulWidget {
  static const String name = "form_screen";
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _segundoNombreController = TextEditingController();
  final _apellido1Controller = TextEditingController();
  final _apellido2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _documentoController = TextEditingController();

  String? _sexo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("estamos en home")),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 320.0),
              child: Container( 
                decoration: BoxDecoration(
                  color: Colors.white, 
                  border: Border.all(
                    color: Colors.lightBlue, 
                    width: 2.0, 
                  ),
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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Formulario de Datos"),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nombreController,
                      decoration: InputDecoration(
                        labelText: "Nombre",
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El nombre es obligatorio";
                        }
                        if (value.length < 2) {
                          return "El nombre debe tener mínimo 2 caracteres";
                        }
              
                        if (value.length > 50) {
                          return "El nombre debe tener maximo 50 carcateres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _segundoNombreController,
                      decoration: InputDecoration(
                        labelText: "Segundo Nombre",
                        
                      ),
                      validator: (value) {
              
                        if (value == null || value.trim().isEmpty) {
                          return null;
                        }
              
                        if (value.trim().length < 2) {
                          return "Debe tener mínimo 2 caracteres";
                        }
              
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _apellido1Controller,
                      decoration: InputDecoration(
                        labelText: "Apelido uno",
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El primer apellido es obligatorio";
                        }
                        if (value.length < 2) {
                          return "Debe tener mínimo 2 caracteres";
                        }
                        if (value.length > 50) {
                          return "El apellido debe tener maximo 50 caracteres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _apellido2Controller,
                      decoration: InputDecoration(
                        labelText: "Apellido Dos",
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El segundo apellido es obligatorio";
                        }
                        if (value.length < 2) {
                          return "Debe tener mínimo 2 caracteres";
                        }
                        if (value.length > 50) {
                          return "El apellido debe tener maximo 50 caracteres";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El email es obligatorio";
                        }
                        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                        if (!emailRegex.hasMatch(value)) {
                          return "Ingrese un email válido";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Paasword",
                        prefixIcon: Icon(Icons.key),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El password es obligatorio";
                        }
                        if (value.length < 6) {
                          return "Debe tener mínimo 6 caracteres";
                        }
                        if (value.length > 15) {
                          return "Debe tener máximo 15 caracteres";
                        }
                        return null;
                      },
                    ),
              
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _telefonoController,
                      decoration: InputDecoration(
                        labelText: "Telefono",
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El teléfono es obligatorio";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "Solo se permiten números";
                        }
                        if (value.length < 7) {
                          return "Debe tener mínimo 7 dígitos";
                        }
                        if (value.length > 15) {
                          return "Debe tener máximo 15 dígitos";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height:30),
                    TextFormField(
                      controller: _documentoController,
                      decoration: InputDecoration(
                        labelText: "Documento",
                        
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "El documento es obligatorio";
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return "El documento solo puede contener números";
                        }
                        if (value.length < 7) {
                          return "Debe tener mínimo 7 dígitos";
                        }
                        if (value.length > 12) {
                          return "Debe tener máximo 12 dígitos";
                        }
                        return null;
                      },
                    ),
              
                    DropdownButtonFormField<String>(
                      value: _sexo,
                      decoration: const InputDecoration(
                        labelText: "Sexo",
                      ),
                      items: const [
                        DropdownMenuItem(value: "M", child: Text("Masculino (M)")),
                        DropdownMenuItem(value: "F", child: Text("Femenino (F)")),
                        DropdownMenuItem(value: "O", child: Text("O")),
                      ],
                      onChanged: (value) => _sexo = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Seleccione una opción válida";
                        }
                        return null;
                      },
                    ),
              
                    SizedBox(height: 20),
                    FilledButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final usuario = Usuario(
                            nombre: _nombreController.text,
                            segundoNombre: _segundoNombreController.text,
                            apellido1: _apellido1Controller.text,
                            apellido2: _apellido2Controller.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            telefono: _telefonoController.text,
                            documento: _documentoController.text,
                            sexo: _sexo!,
                          );
              
                          try {
                            bool ok = await ApiService.enviarUsuario(usuario);
              
                            if (ok) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Datos enviados correctamente"),
                                ),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Error al enviar: $e")),
                            );
                          }
                        }
                      },
                      label: Text("Enviar Datos"),
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      )
    );
  }
}
