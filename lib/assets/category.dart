import 'package:flutter/material.dart';

import 'category_details.dart';
import 'data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1, // Square items
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              // Navigate to category details page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailPage(categoryName: category["name"]),

                ),
              );

            },
            child: Card(
              color: category["color"],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    category["icon"],
                    size: 40,
                    color: Colors.black87,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    category["name"],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Category Detail Page
class CategoryDetailScreen extends StatelessWidget {
  final String categoryName;

  const CategoryDetailScreen({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryName'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Welcome to the $categoryName category!',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
