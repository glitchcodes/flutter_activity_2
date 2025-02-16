import 'package:flutter/material.dart';
import 'package:sample_project/pages/about_page.dart';
import 'package:sample_project/pages/home_page.dart';
import 'package:sample_project/pages/extra_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const appTitle = 'League';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MainApp(title: appTitle)
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({ super.key, required this.title });

  final String title;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  // ROUTER
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(), // 0
    AboutPage(), // 1
    ExtraPage1(), // 2
    Text('Extra page 2'), // 3
    Text('Extra page 3'), // 4
    Text('Extra page 4'), // 5
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
        title: Text(widget.title),
        leading: Builder(
            builder: (context) {
              return IconButton(onPressed: () {
                Scaffold.of(context).openDrawer();
              }, icon: Icon(Icons.menu));
            }),
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex]
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Sample App')
            ),
            ListTile(
              title: Text('Home page'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About page'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Extra page 1'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Extra page 2'),
              selected: _selectedIndex == 3,
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Extra page 3'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Extra page 4'),
              selected: _selectedIndex == 4,
              onTap: () {
                _onItemTapped(4);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}