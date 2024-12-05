import 'package:flutter/material.dart';
import 'places_screen.dart'; // Import PlacesPage
import 'signup_screen.dart'; // Import SignUpScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign In',
      home: const SignInScreen(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF40A3B1), Color(0xFF40A3B1)], // Same Color for Top
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(
                            text: "Let's ",
                            style: TextStyle(color: Colors.indigo), // Dark Blue
                          ),
                          const TextSpan(
                            text: "Travel",
                            style: TextStyle(color: Color(0xFF40A3B1)), // Teal
                          ),
                          const TextSpan(
                            text: " you",
                            style: TextStyle(color: Colors.indigo), // Dark Blue
                          ),
                          const TextSpan(
                            text: " in.",
                            style: TextStyle(color: Color(0xFF40A3B1)), // Teal
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Discover the World with Every Sign In",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF40A3B1), // Teal
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Email or Phone Number Field
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: "Email or Phone Number",
                      hintText: "Enter Email or Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Password Field
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Forgot Password Link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(color: Color(0xFF40A3B1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign In Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        String username = _usernameController.text;

                        if (username.isNotEmpty) {
                          // Navigate to PlacesScreen after Sign In
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlacesPage(username: username),
                            ),
                          );
                        } else {
                          // Show error if username is empty
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter a username')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF40A3B1),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Sign in with Google Button
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: Image.asset('assets/google-icon-logo-symbol-free-png.webp', height: 24),
                      label: const Text(
                        "Sign in with Google",
                        style: TextStyle(fontSize: 16, color: Color(0xFF40A3B1)),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(color: Color(0xFF40A3B1)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Bottom Text with Light Teal Color
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Navigate to SignUpScreen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignUpScreen()),
                        );
                      },
                      child: const Text(
                        "I don't have an account?",
                        style: TextStyle(color: Color(0xFF80D0D8)), // Lighter Teal
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
