import 'package:flutter/material.dart';
import 'package:travel/pages/signin_screen.dart'; // Import the SignIn screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Top white part
          Container(
            height: MediaQuery.of(context).size.height * 0.3, // Made smaller
            color: Colors.white,
          ),
          // Bottom teal part
          Container(
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3),
            height: MediaQuery.of(context).size.height * 0.7,
            color: const Color(0xFF40A3B1),
          ),
          // Central white card
          Align(
            alignment: Alignment.center, // Center the white card
            child: Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Signup form details
                  const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF40A3B1),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField("Full Name", "Enter Full Name"),
                  const SizedBox(height: 20),
                  _buildTextField("Email", "Enter Email"),
                  const SizedBox(height: 20),
                  _buildTextField("Password", "Enter Password", isPassword: true),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                        activeColor: const Color(0xFF40A3B1),
                      ),
                      const Text(
                        "I agree to the processing of ",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Personal data",
                          style: TextStyle(fontSize: 14, color: Color(0xFF40A3B1)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xFF40A3B1),
                    ),
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Sign up with",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialMediaIcon(Icons.facebook, Colors.blue),
                      const SizedBox(width: 20),
                      _buildSocialMediaIcon(Icons.g_mobiledata, Colors.red),
                      const SizedBox(width: 20),
                      _buildSocialMediaIcon(Icons.apple, Colors.black),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SignInScreen()), // Navigate to SignIn page
                          );
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              fontSize: 14, color: Color(0xFF40A3B1)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Text Field Widget
  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF40A3B1),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // Social Media Icon Button Widget
  Widget _buildSocialMediaIcon(IconData icon, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60, // Reduced height for better proportions
        width: 60,  // Ensured a square layout
        decoration: BoxDecoration(
          color: Colors.white, // Added a white background
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          borderRadius: BorderRadius.circular(15), // Refined border radius
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3), // Soft shadow for better clarity
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: 30, color: color), // Increased icon size for better visibility
        ),
      ),
    );
  }
}
