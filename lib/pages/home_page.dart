import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16
              ),
              child: Text(
                "What Pokemon are you looking for?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0)
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search for something'
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(

                    children: [
                      Expanded(child: Card(
                        color: Color(0xFF50BFA5),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Pokedex',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Card(
                        color: Color(0xFFfb6556),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Moves',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Card(
                        color: Color(0xFF429bec),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Abilities',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Card(
                        color: Color(0xFFf7c748),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Items',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Card(
                        color: Color(0xFF7c528c),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Locations',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Card(
                        color: Color(0xFFb1736d),
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            'Type Charts',
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ))
                    ],
                  )
                ],
              )
            ),
          ],
        )
      ),
    );
  }
}