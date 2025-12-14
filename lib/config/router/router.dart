import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otro/config/router/router_model.dart';


import 'package:otro/presentation/home/home.dart';
import 'package:otro/presentation/datos.dart';
import 'package:otro/presentation/login/login_screen.dart';
import 'package:otro/presentation/profile/profile_screen.dart';

final routerConfig = <RouterModel>[
  RouterModel(
    name: HomeScreen.name,
    title: "Home",
    patch: "/",
    description: " ",
    isVisible: false,
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

  RouterModel(
    name: ProfileScreen.name,
    title: "Mi Perfil",
    patch: "/perfil",
    description: "Ver datos del admin",
    isVisible: true, 
    icon: Icons.account_circle,
    screen: (context, state) => const ProfileScreen(),
  ),
 

];

final router = GoRouter(
  initialLocation: '/login',
  routes: [

    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),

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

    GoRoute(
      path: '/perfil',
      name: ProfileScreen.name,
      builder: (context, state) => const ProfileScreen(),
    ),

  ],
);


