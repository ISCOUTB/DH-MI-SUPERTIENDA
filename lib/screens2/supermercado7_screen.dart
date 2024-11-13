import 'package:flutter/material.dart';

class Supermercado7Screen extends StatelessWidget {
  const Supermercado7Screen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Tecnología', 'image': 'assets/categorias/tecnologia.png', 'ruta': '/tecnologia7'},
    {'title': 'Deportes', 'image': 'assets/categorias/deportes.jpg', 'ruta': '/deportes7'},
    {'title': 'Moda', 'image': 'assets/categorias/moda.jpg', 'ruta': '/moda7'},
    {'title': 'Hogar', 'image': 'assets/categorias/hogar.jpg', 'ruta': '/hogar7'},
    {'title': 'Alimentos', 'image': 'assets/categorias/alimentos.jpg', 'ruta': '/alimentos7'},
    {'title': 'Juguetes', 'image': 'assets/categorias/juguetes.jpg', 'ruta': '/juguetes7'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías ALKOSTO'),
        backgroundColor: const Color.fromARGB(255, 0, 53, 211),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 500,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, category['ruta']!);
            },
            child: CategoryItem(
              title: category['title'],
              image: category['image'],
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;

  const CategoryItem({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
