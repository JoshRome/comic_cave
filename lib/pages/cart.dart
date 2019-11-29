import 'package:flutter/material.dart';
//import 'package:comic_cave/components/cart_products.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('View Cart'),
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: new Text("Total:"),
              subtitle: new Text("\$230.00"),
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
}
