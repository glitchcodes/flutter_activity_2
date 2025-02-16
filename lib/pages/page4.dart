import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                        image: AssetImage('assets/4.png'), fit: BoxFit.cover)),
              ),
              SizedBox(
                // separator
                height: 15,
              ),
              const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                // separator
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              SizedBox(
                // separator
                height: 15,
              ),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
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
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline),
                ),
              ),
              const SizedBox(
                // separator
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage('assets/4.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("Login"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
