import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/config/router/router_model.dart';


import 'package:otro/presentation/home/home.dart';
import 'package:otro/presentation/datos.dart';

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
    name: datosScreen.name,
    title: "Datos",
    patch: "/datos",
    description: " ",
    isVisible: true,
    icon: Icons.dataset,
    screen: (context, state) => const datosScreen(),
  ),
 

];

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: '/datos',
      name: datosScreen.name,
      builder: (context, state) => const datosScreen(),
    ),

  ],
);


