import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/config/router/router_model.dart';
import 'package:otro/presentation/admin/layout.dart';
import 'package:otro/presentation/admin/register/registerScreen.dart';
import 'package:otro/presentation/admin/user/userScreen.dart';
import 'package:otro/presentation/home/detail_screen.dart';
import 'package:otro/presentation/home/home.dart';
import 'package:otro/presentation/productos.dart';

final routerConfig = <RouterModel>[
  RouterModel(
    name: HomeScreen.name,
    title: "Home",
    patch: "/",
    description: " ",
    isVisible: true,
    icon: Icons.home,
    screen: (context, state) => const HomeScreen(),
  ),

  RouterModel(
    name: productosScreen.name,
    title: "Producto",
    patch: "/productos",
    description: " ",
    isVisible: true,
    icon: Icons.production_quantity_limits,
    screen: (context, state) => const productosScreen(),
  ),

  RouterModel(
    name: "Description",
    title: "Description",
    patch: "/productos:/id",
    description: "descripcion de producto ",
    isVisible: false,
    icon: Icons.details,
    screen: (context, state) {
      final id = state.pathParameters["id"] ?? '';
      return DetailScreen(id: id);
    },
  ),
];

final router = GoRouter(
  initialLocation: '/',

  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Layout(child: child);
      },
      routes: <GoRoute>[
        GoRoute(
          path: "/admin/user",
          name: "adminUser",
          builder: (context, state) {
            return Userscreen();
          },
        ),

        GoRoute(
          path: "/admin/register",
          name: "adminRegister",
          builder: (context, state) {
            return Registerscreen();
          },
        ),
      ],
    ),
    ...routerConfig.map(
      (e) => GoRoute(path: e.patch, name: e.name, builder: e.screen),
    ),
  ],
);
