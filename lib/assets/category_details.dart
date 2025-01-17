import 'package:flutter/material.dart';

import 'data.dart';

class CategoryDetailPage extends StatefulWidget {
  final String categoryName;

  const CategoryDetailPage({Key? key, required this.categoryName})
      : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  late List<Item> filteredItems;

  @override
  void initState() {
    super.initState();
    // Load items based on the category
    filteredItems = categoryItems[widget.categoryName] ?? [];
  }

  void _filterItems(String query) {
    setState(() {
      filteredItems = (categoryItems[widget.categoryName] ?? []).where((item) {
        return item.name.toLowerCase().contains(query.toLowerCase()) ||
            item.manufacturer.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.categoryName}'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: _filterItems,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          // GridView for items
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.6, // Adjust height
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          item.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        item.manufacturer,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '\$${item.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const SizedBox(height: 5),
                      // Circular "Add to Cart" Button
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                        //    cart.add(item);
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.name} added to cart!'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        backgroundColor: Colors.blue,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ],

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
