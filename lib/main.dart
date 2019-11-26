import 'package:flutter/material.dart';

import './pages/browse.dart';
import './pages/cart.dart';
import './pages/home.dart';
import'./pages/search.dart';

void main() => runApp(ComicCave());

class ComicCave extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ComicCaveState();
  }
}

class ComicCaveState extends State<ComicCave> {
  int _selectedPage = 0;
  final _pageOptions = [
    HomePage(),
    SearchPage(),
    BrowsePage(),
    CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        //backgroundColor: Colors.black26,
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          backgroundColor: Colors.deepPurple,

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.deepPurple
            ),

            BottomNavigationBarItem(icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.deepPurple
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.line_weight),
                title: Text('Browse'),
                backgroundColor: Colors.deepPurple
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text('View Cart'),
                backgroundColor: Colors.deepPurple
            ),
          ],
        ),
      ),
    );
  }
}
