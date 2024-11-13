import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondoweb.jpg'),
                fit: BoxFit.cover, // Ajustamos la imagen al tamaño de la pantalla
              ),
            ),
          ),
          // Rectángulo flotante con campos de login y botones
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.85, // Ancho relativo del 85% de la pantalla
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Fondo blanco semitransparente
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26, // Sombra
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5), // Borde sutil
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Ajusta el tamaño basado en el contenido
                  children: [
                    const Text(
                      'Inicio',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20), // Espaciado fijo
                    // Campo de correo electrónico
                    SizedBox(
                      width: double.infinity, // Ancho flexible para el campo
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10), // Espaciado entre campos
                    // Campo de contraseña
                    SizedBox(
                      width: double.infinity, // Ancho flexible para el campo
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20), // Espaciado entre campos y botones
                    // Botón de ingresar
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15), // Adaptable en vertical
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
                      ),
                      child: const Text('Ingresar'),
                    ),
                    const SizedBox(height: 20), // Espaciado entre botones
                    // Opción de registrarse
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        '¿No tienes cuenta? Regístrate',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
