// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:otro/service/login/login_service.dart';
// import 'package:go_router/go_router.dart';
// import 'package:otro/presentation/widget/layaout/drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formController = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  void loginSer(BuildContext context) async {
    if (!_formController.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("ingrese todos los campos")));
      return;
    }

    setState(() {
      _isLoading = false;
    });

    String msn = await  LoginService.getToken(_userController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formController,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login"),
                SizedBox(height: 16),
                TextFormField(
                  controller: _userController,
                  decoration: InputDecoration(
                    labelText: "Usuario",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "campo requerido"
                        : null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.key),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "campo requerido"
                        : null;
                  },
                ),

                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    icon: _isLoading
                        ? CircularProgressIndicator()
                        : Icon(Icons.login),
                    onPressed: () {
                      loginSer(context);
                    },
                    label: Text("LOgin"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
