import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sprint 2: simple placeholder list of favorites
    final dummyFavorites = List.generate(3, (index) {
      return {"name": "Product ${index + 1}", "price": "\$${(index + 1) * 10}"};
    });

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F4),
      appBar: AppBar(
        title: const Text("Favorites"),
        backgroundColor: const Color(0xFFff7918),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Sprint 2: no backend, just simulate refresh
          await Future.delayed(const Duration(seconds: 1));
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: dummyFavorites.length,
          itemBuilder: (context, index) {
            final item = dummyFavorites[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                leading: const Icon(
                  Icons.shopping_bag,
                  size: 40,
                  color: Colors.grey,
                ),
                title: Text(item["name"]!),
                subtitle: Text(item["price"]!),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${item["name"]} removed from favorites"),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
