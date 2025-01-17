import 'package:flutter/material.dart';

import 'assets/category.dart';
import 'assets/data.dart';


// Home Screen
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  int _selectedIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "data:image/jpeg;base64,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", // User profile image URL
              ),
            ),
            const SizedBox(width: 10),
            const Text('Bertilla'), // Replace with user's name
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://via.placeholder.com/150", // User profile image URL
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'John Doe',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Text(
                    'johndoe@gmail.com',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('My Cart'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorites'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8, // Adjust to change card height
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          );
        },
      ),
        // BottomNavigationBar with Categories Navigation
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });

            // Handle navigation for each tab
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesScreen()),
              );
            }
          },
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),

    );
  }
}
// change 1

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}
