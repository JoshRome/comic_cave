import 'package:comic_cave/components/RecProducts.dart' as gridOne;
import 'package:comic_cave/components/Upcoming.dart' as gridTwo;
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
    return Scaffold(
//      backgroundColor: Colors.black87,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Featured'),
        bottom: new TabBar(
          controller: controller,

          tabs: <Widget>[
            new Tab(text: "Recommended"),
            new Tab(text: "Upcoming"),
          ],
        ),
      ),

      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new gridOne.RecProducts(),
          new gridTwo.Upcoming()
        ],
      ),
    );
  }
}
