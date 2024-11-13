import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          // Rectángulo flotante con logo y botones
          Center(
            child: FractionallySizedBox(
              widthFactor: 0.85, // Ocupa el 85% del ancho de la pantalla
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8), // Fondo blanco semitransparente
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      spreadRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Se adapta al contenido
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo adaptable al ancho
                    FractionallySizedBox(
                      widthFactor: 0.6, // Ocupa el 60% del contenedor
                      child: Image.asset('assets/logo.png'),
                    ),
                    const SizedBox(height: 20),
                    // Botón de Iniciar Sesión
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
                      ),
                      child: const Text('Inicio de Sesión'),
                    ),
                    const SizedBox(height: 20),
                    // Botón de Registrarse
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.045),
                      ),
                      child: const Text('Registrarme'),
                    ),
                    const SizedBox(height: 20),
                    // Nuevo botón "Continuar como invitado"
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withOpacity(0.6),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      child: const Text('Continuar como Invitado'),
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
