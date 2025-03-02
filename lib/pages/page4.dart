import 'package:flutter/material.dart';
import 'package:sample_project/utils.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool rememberMe = false;
  String? _emailError;
  String? _passwordError;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonDisabled = true;

  void _clearErrors() {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });
  }

  void _login() {
    _clearErrors();

    try {
      bool isAuthenticated =
          Login.authenticate(_emailController.text, _passwordController.text);

      if (isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Success"),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } on LoginException catch (e) {
      setState(() {
        _emailError = e.errors['email']?.isNotEmpty == true
            ? "\u00A0${e.errors['email']![0]}\u00A0"
            : null;
        _passwordError = e.errors['password']?.isNotEmpty == true
            ? "\u00A0${e.errors['password']![0]}\u00A0"
            : null;
      });
    }
  }

  void _updateButtonState() {
    setState(() {
      _isButtonDisabled = _emailController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    _emailController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateButtonState);
    _passwordController.removeListener(_updateButtonState);
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF000000),
              Color(0xFF8B0000),
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
                TextFormField(
                  maxLength: 255,
                  controller: _emailController,
                  onChanged: (value) {
                    _clearErrors();
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: _emailController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _emailController.clear();
                                _clearErrors();
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ))
                          : null,
                      errorText: _emailError,
                      errorStyle: TextStyle(
                          backgroundColor: Colors.white, color: Colors.red)),
                ),
                const SizedBox(
                  // separator
                  height: 15,
                ),
                TextFormField(
                  maxLength: 255,
                  controller: _passwordController,
                  obscureText: true,
                  onChanged: (value) {
                    _clearErrors();
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      suffixIcon: _passwordController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _passwordController.clear();
                                _clearErrors();
                              },
                              icon: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ))
                          : null,
                      errorText: _passwordError,
                      errorStyle: TextStyle(
                          backgroundColor: Colors.white, color: Colors.red)),
                ),
                const SizedBox(
                  // separator
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Page not yet implemented."),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
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
                  onPressed: _isButtonDisabled ? null : _login,
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
