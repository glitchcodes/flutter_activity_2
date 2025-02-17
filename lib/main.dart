import 'package:flutter/material.dart';
import 'package:sample_project/pages/about_page.dart';
import 'package:sample_project/pages/home_page.dart';
import 'package:sample_project/pages/extra_page1.dart';
import 'package:sample_project/pages/page2.dart';
import 'package:sample_project/pages/page3.dart';
import 'package:sample_project/pages/page4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'SCP Foundation';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, home: MainApp(title: appTitle));
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key, required this.title});

  final String title;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  // ROUTER
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(), // 0
    ExtraPage1(), // 1
    Page2(), // 2
    Page3(), // 3
    Page4() // 4
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.black,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: Colors.white)); // Change color here
        }),
        iconTheme: IconThemeData(color: Colors.white), // Change color here
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
      drawer: Drawer(
        child: Container(
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
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/scp.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Text("", style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                title: Text('Report',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                selected: _selectedIndex == 1,
                onTap: () {
                  _onItemTapped(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('SCP-420',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                selected: _selectedIndex == 2,
                onTap: () {
                  _onItemTapped(2);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('SCP-069',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                selected: _selectedIndex == 3,
                onTap: () {
                  _onItemTapped(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                selected: _selectedIndex == 4,
                onTap: () {
                  _onItemTapped(4);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
