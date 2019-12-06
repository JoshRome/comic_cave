import'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  final comicName;
  final price;

  CartProducts({this.comicName, this.price});

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
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
              leading: new Text("Total:"),
              title: widget.price == null ? new Text("Empty Cart") : new Text(
                  "${widget.price}"),
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

  Widget calcTotal() {
    // return;
  }

  Widget buildRow() {
    return new ListTile(
      leading: Text(widget.comicName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      title: Text(widget.price, style: TextStyle(
          color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0)),
    );
  }
}
