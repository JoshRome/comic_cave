import 'package:flutter/material.dart';

import './pages/browse.dart';
import './pages/cart.dart';
import './pages/home.dart';

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
                icon: Icon(Icons.home, color: Colors.white),
                title: Text('Home', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.deepPurple
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.line_weight, color: Colors.white),
                title: Text('Browse', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.deepPurple
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                title: new Text(
                  'View Cart', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.deepPurple
            ),
          ],
        ),
      ),
    );
  }

//  Future getData() async{
//    var url = 'https://comiccave.space/get.php';
//    http.Response response = await http.get(url);
//    var data = jsonDecode(response.body);
//    print(data.toString());
//  }
//
//  @override
//  void initState() {
//    getData();
//  }
}
