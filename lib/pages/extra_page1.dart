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
        crossAxisAlignment: CrossAxisAlignment.center, // stuff to align
        children: [ //this where all the text magic happens
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BoxedText('Sample text and sample paragraph written by Johann the goat yee.'),
                BoxedText('Here is some additional text to extend the paragraph and make it more complete.'),

                // Row with multiple BoxedText elements on the same line
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxedText('First box'),
                    SizedBox(width: 10), // Space between boxes
                    BoxedText('Second box'),
                  ],
                ),

                BoxedText('Here is some additional text to extend the paragraph and make it more complete.'),
                BoxedText('Sample text and sample paragraph written by Johann the goat yee.'),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BoxedText('More box'),
                    SizedBox(width: 10), // Space between boxes
                    BoxedText('Even more box'),

                  ],

                ),
                BoxedText('Boxed text to copy the exact picture.'),
              ],

            ),

          ),
          const Spacer(), // Pushes buttons to the bottom 2 follow da layout
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
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

class BoxedText extends StatelessWidget { //boxedtext class 2 box da damn tings
  final String text;
  const BoxedText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container( //css stuff
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light background
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}
