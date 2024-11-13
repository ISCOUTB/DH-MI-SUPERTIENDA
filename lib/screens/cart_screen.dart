import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text('Carrito de Compras'),
      ),
      body: cart.itemCount == 0
          ? const Center(
              child: Text(
                'Tu carrito está vacío',
                style: TextStyle(fontSize: 20),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.itemCount,
                    itemBuilder: (context, index) {
                      final product = cart.items[index];
                      return ListTile(
                        leading: Image.network(
                          product.image,
                          width: screenWidth * 0.15, // Tamaño de imagen adaptado
                          height: screenWidth * 0.15,
                          fit: BoxFit.cover,
                        ),
                        title: Text(
                          product.title,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // Tamaño del texto adaptable
                          ),
                        ),
                        subtitle: Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, // Tamaño del texto adaptable
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cart.removeItem(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      cart.clearCart();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Compra realizada con éxito'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(screenWidth * 0.12), // Tamaño adaptable del botón
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        fontSize: screenWidth * 0.05, // Tamaño del texto adaptable
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text('Realizar compra'),
                  ),
                ),
              ],
            ),
    );
  }
}
