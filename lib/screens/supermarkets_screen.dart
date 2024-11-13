import 'package:flutter/material.dart';

class SupermarketsScreen extends StatelessWidget {
  const SupermarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> supermercados = [
      {'nombre': 'EXITO', 'imagen': 'assets/images/supermercado1.png', 'ruta': '/supermercado1'},
      {'nombre': 'JUMBO', 'imagen': 'assets/images/supermercado2.png', 'ruta': '/supermercado2'},
      {'nombre': 'CARULLA', 'imagen': 'assets/images/supermercado3.png', 'ruta': '/supermercado3'},
      {'nombre': 'SURTIMAX', 'imagen': 'assets/images/supermercado4.png', 'ruta': '/supermercado4'},
      {'nombre': 'ARA', 'imagen': 'assets/images/supermercado5.png', 'ruta': '/supermercado5'},
      {'nombre': 'MEGA T.', 'imagen': 'assets/images/supermercado6.png', 'ruta': '/supermercado6'},
      {'nombre': 'ALKOSTO', 'imagen': 'assets/images/supermercado7.png', 'ruta': '/supermercado7'},
      {'nombre': 'D1', 'imagen': 'assets/images/supermercado8.png', 'ruta': '/supermercado8'},
      {'nombre': 'METRO', 'imagen': 'assets/images/supermercado9.png', 'ruta': '/supermercado9'},
      {'nombre': 'MAKRO', 'imagen': 'assets/images/supermercado10.png', 'ruta': '/supermercado10'},
      {'nombre': 'OLIMPICA', 'imagen': 'assets/images/supermercado11.png', 'ruta': '/supermercado11'},
      {'nombre': 'FALABELLA', 'imagen': 'assets/images/supermercado12.png', 'ruta': '/supermercado12'},
    ];

    // Detecta el ancho de la pantalla
    final double screenWidth = MediaQuery.of(context).size.width;
    // Calcula el número de columnas según el ancho de la pantalla
    int crossAxisCount = screenWidth > 600 ? 4 : screenWidth > 400 ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text('Supermercados'),
      ),
      body: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: supermercados.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            final supermercado = supermercados[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, supermercado['ruta']!);
              },
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          supermercado['imagen']!,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      supermercado['nombre']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
