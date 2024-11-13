// screens2/tecnologia_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ModaaraScreen extends StatelessWidget {
  const ModaaraScreen({super.key});

  final List<Product> products = const [
    Product(
      id: 'p1',
      title: 'producto1',
      image: 'assets/productos/producto2.jpg',
      price: 10000,
    ),
    Product(
      id: 'p2',
      title: 'producto2',
      image: 'assets/productos/producto3.jpg',
      price: 20000,
    ),
    Product(
      id: 'p3',
      title: 'producto3',
      image: 'assets/productos/producto4.jpg',
      price: 15000,
    ),
    Product(
      id: 'p4',
      title: 'producto4',
      image: 'assets/productos/producto5.jpg',
      price: 25000,
    ),
    Product(
      id: 'p5',
      title: 'producto5',
      image: 'assets/productos/producto6.jpg',
      price: 50000,
    ),
    Product(
      id: 'p6',
      title: 'producto6',
      image: 'assets/productos/producto7.jpg',
      price: 17000,
    ),
    Product(
      id: 'p7',
      title: 'producto7',
      image: 'assets/productos/producto8.jpg',
      price: 45000,
    ),
    Product(
      id: 'p8',
      title: 'producto8',
      image: 'assets/productos/producto9.jpg',
      price: 35000,
    ),
    Product(
      id: 'p9',
      title: 'producto9',
      image: 'assets/productos/producto10.jpg',
      price: 50000,
    ),
    Product(
      id: 'p10',
      title: 'producto10',
      image: 'assets/productos/legumbres.jpg',
      price: 5000,
    ),
    // Agrega más productos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moda ARA'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8, // Número de columnas
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 2 / 3, // Ajusta según el diseño
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(product: product);
              },
            ),
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              child: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Para que la imagen ocupe todo el ancho
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.title,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                cart.addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.title} agregado al carrito'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              child: const Text('Agregar al carrito'),
            ),
          ),
        ],
      ),
    );
  }
}
