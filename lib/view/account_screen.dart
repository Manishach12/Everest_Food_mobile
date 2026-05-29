import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sprint 2: simple placeholder account screen
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F4),
      appBar: AppBar(
        title: const Text("Account"),
        backgroundColor: const Color(0xFFff7918),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // ✅ Logo placeholder
            const Icon(Icons.person, size: 100, color: Color(0xFFff7918)),
            const SizedBox(height: 10),

            // ✅ User email placeholder
            const Text(
              "guest@example.com",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // ✅ Settings options
            _makeSettings(
              icon: const Icon(Icons.sell),
              title: "My Courses",
              subtitle: "Get listing of my Courses",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Navigate to My Courses")),
                );
              },
            ),
            _makeSettings(
              icon: const Icon(Icons.logout),
              title: "Logout",
              subtitle: "Logout from this application",
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
            _makeSettings(
              icon: const Icon(Icons.android),
              title: "Version",
              subtitle: "0.0.1",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeSettings({
    required Icon icon,
    required String title,
    required String subtitle,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Card(
          elevation: 4,
          color: Colors.white,
          child: ListTile(
            leading: icon,
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
