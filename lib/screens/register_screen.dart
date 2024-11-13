import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: null, // Elimina la barra superior
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
          // Rectángulo flotante con campos de registro y botón
          Center(
            child: Container(
              width: screenWidth * 0.8, // Ancho adaptable
              height: screenHeight * 0.8, // Altura adaptable
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Registro',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Campo de nombre
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Nombre',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Campo de apellido
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Apellido',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Campo de correo electrónico
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Correo electrónico',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Campo de contraseña
                    SizedBox(
                      width: screenWidth * 0.7,
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
                    SizedBox(height: screenHeight * 0.02),
                    // Campo de confirmación de contraseña
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirmar contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // Botón de registrarse
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login'); // Redirige a la página de inicio de sesión
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                          horizontal: screenWidth * 0.15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: TextStyle(
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      child: const Text('Registrarme'),
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
