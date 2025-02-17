import 'package:flutter/material.dart';
import 'package:sample_project/main.dart'; // Import your main.dart file

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 150), // Adds margin for balance
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF000000), // Black
                Color(0xFF8B0000), // Dark Red
              ], // Gradient background
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section
              const Text(
                'SCP 069 - Convict 212 - Danger Class Keter',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 10),

              // Separator Line
              Container(
                height: 4,
                width: 120,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),

              // Image Section (Static Size with Padding)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.25,
                  width: MediaQuery.of(context).size.width *
                      0.5, // Connects to the whole screen with margins
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/4.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Text Section inside a Card
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Text(
                  'SCP-212 is a humanoid individual suffering from severe strabismus (crossed eyes). However, their condition is not merely a visual impairment—it is a gateway to an anomalous perception of reality. When SCP-212 focuses both eyes on a single point, they inadvertently open a rift between dimensions, allowing brief glimpses of impossible landscapes and entities that do not adhere to known physical laws.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 30),

              // Styled Button
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApp()), // Redirect to Main
                      (route) => false, // Clears navigation stack
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black12,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.black12,
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
