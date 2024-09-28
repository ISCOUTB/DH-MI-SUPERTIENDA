import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Importar las pantallas
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_page.dart'; // Importar las nuevas pantallas
import 'screens/categories_screen.dart';
import 'screens/offers_screen.dart';
import 'screens/supermarkets_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/profile_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mi Super App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Definir la ruta inicial
      routes: {
        // Rutas existentes
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),

        // Nuevas rutas
        '/home': (context) => const HomePage(),
        '/categories': (context) => const CategoriesScreen(),
        '/offers': (context) => const OffersScreen(),
        '/supermarkets': (context) => const SupermarketsScreen(),
        '/cart': (context) => const CartScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
