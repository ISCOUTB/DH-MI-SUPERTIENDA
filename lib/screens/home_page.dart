import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      style: DrawerStyle.defaultStyle,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      borderRadius: 24.0,
      showShadow: true,
      angle: 0.0,
      slideWidth: MediaQuery.of(context).size.width * 0.75, // Aumenta el ancho del menú para pantallas pequeñas
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  ZoomDrawer.of(context)?.close();
                },
              ),
            ),
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[400],
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Mi SUPERTIENDA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.local_offer, color: Colors.white),
                    title: const Text('Ofertas', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      ZoomDrawer.of(context)?.close();
                      Navigator.pushNamed(context, '/offers');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.store, color: Colors.white),
                    title: const Text('Supermercados', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      ZoomDrawer.of(context)?.close();
                      Navigator.pushNamed(context, '/supermarkets');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart, color: Colors.white),
                    title: const Text('Carrito', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      ZoomDrawer.of(context)?.close();
                      Navigator.pushNamed(context, '/cart');
                    },
                  ),
                  const Divider(color: Colors.white70),
                  ListTile(
                    leading: const Icon(Icons.account_circle, color: Colors.white),
                    title: const Text('Perfil', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      ZoomDrawer.of(context)?.close();
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      ZoomDrawer.of(context)?.close();
                      Navigator.pushNamed(context, '/login');
                    }
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)?.toggle();
          },
        ),
        title: Center(
          child: IconButton(
            icon: Image.asset('assets/logo.png', height: 40),
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              items: [
                Image.asset('assets/productos/producto1.jpg', fit: BoxFit.cover),
                Image.asset('assets/productos/producto2.jpg', fit: BoxFit.cover),
                Image.asset('assets/productos/producto3.jpg', fit: BoxFit.cover),
                Image.asset('assets/productos/producto4.jpg', fit: BoxFit.cover),
                Image.asset('assets/productos/producto5.jpg', fit: BoxFit.cover),
                Image.asset('assets/productos/producto6.jpg', fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                height: screenHeight * 0.35, // Ajusta la altura en función del tamaño de la pantalla
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (i) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == i ? Colors.blue : Colors.grey,
              ),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Bienvenido a Mi SUPERTIENDA',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
