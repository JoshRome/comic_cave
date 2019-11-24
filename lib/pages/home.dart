import 'package:comic_cave/components/RecProducts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  TabController controller;

  void initState() {
    controller = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
//    Widget imageCarousel = new Container(
//        height: 175,
//        child: new Carousel(
//          boxFit: BoxFit.cover,
//          images: [
//            AssetImage('images/m0.PNG'),
//            AssetImage('images/m1.PNG'),
//            AssetImage('images/m2.PNG'),
//            AssetImage('images/m3.PNG'),
//          ],
//          autoplay: false,
////      animationCurve: Curves.fastOutSlowIn,
////      animationDuration: Duration(milliseconds: 1000),
//          dotSize: 4.0,
//          indicatorBgPadding: 4.0,
//        ));

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Featured'),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(text: "Upcoming"),
            new Tab(text: "Recommended"),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          // Image carousel starts here
          // imageCarousel,

          // GridView
          Container(
            height: 320.0,
            child: RecProducts(),
          )
        ],
      ),
    );
  }
}
