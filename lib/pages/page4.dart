import 'package:flutter/material.dart';

const errorMessages = {
  "emptyField": "Required",
  "emailField": {"noMatch": "No account matches these credentials."}
};

const initialData = {
  "email": "example@test.com",
  "password": "password",
  "rememberMe": true
};

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool rememberMe = false;
  String email = "";
  String password = "";
  var errors = {"emailError": "", "passwordError": ""};

  @override
  void initState() {
    super.initState();
    email = initialData["email"] as String;
    password = initialData["password"] as String;
    rememberMe = initialData["rememberMe"] as bool;
  }

  void clearErrors() {
    errors["emailError"] = "";
    errors["passwordError"] = "";
  }

  void attemptLogin() {
    setState(() {
      if (email.isEmpty || password.isEmpty) {
        errors["emailError"] =
            email.isEmpty ? errorMessages["emptyField"] as String : "";

        errors["passwordError"] =
            password.isEmpty ? errorMessages["emptyField"] as String : "";

        return;
      }
      clearErrors();
      errors["emailError"] =
          (errorMessages["emailField"] as Map<String, String>)["noMatch"] ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000), // Black
              Color(0xFF8B0000), // Dark Red
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min, // column height fits content only
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // full width children
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/logo.png'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  // separator
                  height: 15,
                ),
                const Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  // separator
                  height: 20,
                ),
                const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  // separator
                  height: 15,
                ),
                const TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  // separator
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                ),
                const SizedBox(
                  // separator
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Black background
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 8),
                      const Text(
                        "Login",
                        style: TextStyle(color: Colors.white), // White text
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
