import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lilacapp/Screens/Home.dart';
import 'package:flutter_lilacapp/common/Apiconnect.dart';
import 'package:flutter_lilacapp/models/loginmodel.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    'assets/Group 655.png', // Path to your logo image
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(height: 20),

                // Title
                const Text(
                  "Login With Your Email \n& Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Email Field
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    labelText: "Email",
                    prefixIcon: Image.asset(
                      'assets/Email.png', // Path to your lock icon image
                      height: 24,
                      width: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    labelText: "Password",
                    prefixIcon: Image.asset(
                      'assets/lock.png', // Path to your lock icon image
                      height: 24,
                      width: 24,
                    ),
                    suffixIcon: Image.asset(
                      'assets/eye-slash.png', // Path to your eye icon image
                      height: 24,
                      width: 24,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Color(0xFF7C4DFF), // Purple color
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                SizedBox(
                  height: 230,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF63192F), // Maroon background
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      performLogin(context, emailController.text,
                          passwordController.text);
                      // Add login logic here
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Navigate to register page
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Color(0xFF7C4DFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void performLogin(BuildContext context, String email, String password) async {
    // Show loading indicator if needed
    print("Attempting to log in...");

    LoginModel? response = await login(email, password);

    if (response != null && response.status == true) {
      print("Login Successful! Token: ${response.token}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Welcome, ${response.data?.name}!")),
      );

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardScreen()));
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', response.token ?? "");
    } else {
      print("Login Failed");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text("Login Failed: ${response?.message ?? "Error"}")),
      );
    }
  }

  Future<LoginModel?> login(String email, String password) async {
    const String suburl = "vendor-login"; // Add your API endpoint
    Map<String, String> requestBody = {
      "email": email,
      "password": password,
    };

    try {
      // Make POST request
      http.Response response = await postJson(suburl, requestBody);

      // Debugging: Print the response
      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        // Parse JSON response into LoginModel
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        LoginModel loginModel = LoginModel.fromJson(jsonResponse);
        print("Login Successful: ${loginModel.message}");
        // Store the token in SharedPreferences
        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', loginModel.token!);

        return loginModel;
      } else {
        print("Login Failed: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Error during login: $e");
      return null;
    }
  }
}
