import 'package:flutter/material.dart';

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
            itemCount: data == null ? 0 : data.length,
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

//class ListDisplay extends StatefulWidget {
//  @override
//  State createState() => new DyanmicList();
//}
//
//class DyanmicList extends State<ListDisplay> {
//  List<String> litems = [];
//  final TextEditingController eCtrl = new TextEditingController();
//  @override
//  Widget build (BuildContext ctxt) {
//    return new Scaffold(
//        appBar: new AppBar(title: new Text("Dynamic Demo"),),
//        body: new Column(
//          children: <Widget>[
//            new TextField(
//              controller: eCtrl,
//              onSubmitted: (text) {
//                litems.add(text);
//                eCtrl.clear();
//                setState(() {});
//              },
//            ),
//            new Expanded(
//                child: new ListView.builder
//                  (
//                    itemCount: litems.length,
//                    itemBuilder: (BuildContext ctxt, int Index) {
//                      return new Text(litems[Index]);
//                    }
//                )
//            )
//          ],
//        )
//    );
//  }
//}