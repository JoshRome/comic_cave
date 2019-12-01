import 'package:comic_cave/components/BrowseProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrowsePage extends StatefulWidget {
  @override
  _BrowsePageState createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {

  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text("Browse");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: cusSearchBar,
        actions: <Widget>[
          new IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    textInputAction: TextInputAction.go,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  );
                }
                else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text("Browse");
                }
              });
            },
          ),
        ],
      ),
      body: BrowseProducts(),
    );
  }
}

