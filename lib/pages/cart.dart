import 'package:flutter/material.dart';
//import 'package:comic_cave/components/cart_products.dart';

class CartPage extends StatefulWidget {
  final comicName;
  final price;

  CartPage({this.comicName, this.price});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('View Cart'),
      ),
      body: new Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
              return buildRow();
            }
        ),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text(widget.price),
            )),

            Expanded(
              child: new MaterialButton(
                  onPressed: () {},
                  child: new Text(
                      "Check out", style: TextStyle(color: Colors.white,)),
                  color: Colors.deepPurple),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRow() {
    return new ListTile(
        title: new Text(widget.comicName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
    );
  }
}
