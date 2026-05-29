import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, String>> categories = const [
    {
      "name": "Pizza",
      "image":
          "https://images.unsplash.com/photo-1601924582971-6e1b3b6c1f5b?auto=format&fit=crop&w=400&q=80",
    },
    {
      "name": "Burgers",
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=400&q=80",
    },
    {
      "name": "Desserts",
      "image":
          "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=400&q=80",
    },
  ];

  final List<Map<String, String>> products = const [
    {
      "name": "Margherita Pizza",
      "price": "Rs 350",
      "image":
          "https://images.unsplash.com/photo-1601924582971-6e1b3b6c1f5b?auto=format&fit=crop&w=600&q=80",
    },
    {
      "name": "Cheese Burger",
      "price": "Rs 250",
      "image":
          "https://images.unsplash.com/photo-1550547660-d9450f859349?auto=format&fit=crop&w=600&q=80",
    },
    {
      "name": "Chocolate Cake",
      "price": "Rs 400",
      "image":
          "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=600&q=80",
    },
    {
      "name": "Pasta Alfredo",
      "price": "Rs 300",
      "image":
          "https://images.unsplash.com/photo-1525755662778-989d0524087e?auto=format&fit=crop&w=600&q=80",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                margin: const EdgeInsets.only(top: 60),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ✅ Food banner
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?auto=format&fit=crop&w=800&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ✅ Welcome text
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Welcome, Guest",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ✅ Food categories
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: categories.map((cat) {
                            return Container(
                              width: 150,
                              margin: const EdgeInsets.only(right: 10),
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  children: [
                                    Image.network(
                                      cat["image"]!,
                                      height: 100,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(cat["name"]!),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ✅ Food products
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Popular Dishes",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.count(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(10),
                        children: products.map((prod) {
                          return Card(
                            elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  prod["image"]!,
                                  height: 120,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        prod["name"]!,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        prod["price"]!,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ✅ Header
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Everest Food",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Icon(Icons.search, size: 28),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
