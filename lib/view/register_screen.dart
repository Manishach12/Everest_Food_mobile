import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  File? _img;
  bool _termsAccepted = false;

  Future _browseImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image != null) setState(() => _img = File(image.path));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Create Account",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFff7918),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _key,
          child: Column(
            children: [
              // Profile Picture Upload
              GestureDetector(
                onTap: () => _showImageSourceOptions(),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: _img != null ? FileImage(_img!) : null,
                  child: _img == null
                      ? const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey,
                        )
                      : null,
                ),
              ),
              const SizedBox(height: 30),

              _buildTextField(
                _fnameController,
                'Full Name',
                Icons.person_outline,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                _emailController,
                'Email Address',
                Icons.email_outlined,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                _passwordController,
                'Password',
                Icons.lock_outline,
                isPassword: true,
              ),

              const SizedBox(height: 10),
              CheckboxListTile(
                value: _termsAccepted,
                onChanged: (val) => setState(() => _termsAccepted = val!),
                title: const Text(
                  "I accept Terms & Conditions",
                  style: TextStyle(fontSize: 14),
                ),
                activeColor: const Color(0xFFff7918),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate() && _termsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration Successful'),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFff7918),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextController,
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: TextController,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (val) => val!.isEmpty ? 'Field required' : null,
    );
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () => _browseImage(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery'),
              onTap: () => _browseImage(ImageSource.gallery),
            ),
          ],
        ),
      ),
    );
  }
}
