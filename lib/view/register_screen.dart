import 'package:flutter/material.dart';

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
  bool _termsAccepted = false;

  // Track if user "selected" an avatar (toggle between camera and person icon)
  bool _avatarSelected = false;

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
              // ✅ Profile Picture Placeholder (no external assets)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _avatarSelected = !_avatarSelected;
                  });
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[200],
                  child: _avatarSelected
                      ? const Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xFFff7918),
                        )
                      : const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.grey,
                        ),
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
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      validator: (val) => val!.isEmpty ? 'Field required' : null,
    );
  }
}
