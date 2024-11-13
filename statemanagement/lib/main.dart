import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorites App',
      initialRoute: '/',
      routes: {
        '/': (context) => ProductsScreen(),
        '/favorites': (context) => FavoritesScreen(),
      },
    );
  }
}

class ProductsScreen extends StatelessWidget {
  final List<String> products = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Product List',
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text(products[index]),
              trailing: Consumer<Favorites>(
                builder: (context, favorites, child) {
                  return IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {
                      favorites.addItem(products[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${products[index]} added to favorites!'),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/favorites');
        },
        tooltip: 'Go to Favorites',
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Your Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, favoritesData, child) {
          final favoriteItems = favoritesData.items;

          if (favoriteItems.isEmpty) {
            return const Center(
              child: Text('No favorites yet!'),
            );
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(favoriteItems[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      favoritesData.removeItem(favoriteItems[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${favoriteItems[index]} removed from favorites!'),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}