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
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                onChanged: (value) => {
                  setState(() {
                    email = value;
                  })
                },
              ),
              Visibility(
                visible: errors["emailError"]!.isNotEmpty,
                child: Text(
                  errors["emailError"]!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                // separator
                height: 10,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
                onChanged: (value) => {
                  setState(() {
                    password = value;
                  })
                },
              ),
              Visibility(
                visible: errors["passwordError"]!.isNotEmpty,
                child: Text(
                  errors["passwordError"]!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                // separator
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Remember Me:"),
                  Switch(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      })
                ],
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
                onPressed: attemptLogin,
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
                          image: AssetImage('assets/pokeball-1.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Login",
                      style: TextStyle(color: Colors.black),
                    ),
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
