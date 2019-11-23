import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import './components/RecProducts.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _index = 0;
  @override
  Widget build(BuildContext context ){
  Widget image_carousel = new Container(
    height: 200,
    child: new Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('images/m0.PNG'),
        AssetImage('images/m1.PNG'),
        AssetImage('images/m2.PNG'),
        AssetImage('images/m3.PNG'),
      ],
      autoplay: false,
//      animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 1000),
    dotSize: 4.0,
      indicatorBgPadding: 4.0,
    )
  );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Featured'),
//        actions: <Widget>[
//          new IconButton(icon: Icon(Icons.search), color: Colors.white, onPressed: (){}),
//          new IconButton(icon: Icon(Icons.shopping_cart), color: Colors.white, onPressed: (){})
//        ],
      ),

      body: new ListView(
        children: <Widget>[
          // Image caraousel starts here
          image_carousel,
           //Tabs
           new Padding(padding: const EdgeInsets.all(8.0),
           child: new Text('Recommended'), ),

          // GridView
          Container(
            height: 320.0,
            child: RecProducts(),
          )
        ],
      ),

      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.deepPurple
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.search),
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
        onTap: (index){
          setState(() {
            _index = index;
          }
          );
        },
      ),

    );
  }
}


