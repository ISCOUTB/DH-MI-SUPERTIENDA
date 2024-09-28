import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Tecnología', 'color': Colors.lightBlueAccent},
    {'title': 'Deportes', 'color': Colors.lightBlueAccent},
    {'title': 'Moda', 'color': Colors.lightBlueAccent},
    {'title': 'Hogar', 'color': Colors.lightBlueAccent},
    {'title': 'Alimentos', 'color': Colors.lightBlueAccent},
    {'title': 'Juguetes', 'color': Colors.lightBlueAccent},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Categorías'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500, // Ancho máximo de cada elemento
          childAspectRatio: 3 / 2,  // Proporción del aspecto del grid
          crossAxisSpacing: 10,     // Espacio horizontal entre elementos
          mainAxisSpacing: 10,      // Espacio vertical entre elementos
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return CategoryItem(
            title: categories[index]['title'],
            color: categories[index]['color'],
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  const CategoryItem({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 50,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

