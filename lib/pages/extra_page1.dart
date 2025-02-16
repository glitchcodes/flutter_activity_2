import 'package:flutter/material.dart';

class ExtraPage1 extends StatelessWidget {
  const ExtraPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Extra Page 1 Title',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Sample text and sample paragraph written by Johann the goat yee.\n\n'
                  'Here is some additional text to extend the paragraph and make it more complete.\n\n'
                  'Here is some additional text to extend the paragraph and make it more complete.'
                  ' Here is some additional text to extend the paragraph and make it more complete.\n\n'
                  'Sample text and sample paragraph written by Johann the goat yee',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(), // Pushes content up and buttons down
          Padding(
            padding: const EdgeInsets.only(bottom: 30), // Adds some bottom padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Submit button clicked!')),
                    );
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 10), // Space between buttons
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Wala tong ginagawa')),
                    );
                  },
                  child: const Text('Back'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
