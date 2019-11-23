import 'package:flutter/material.dart';

class RecProducts extends StatefulWidget {
  @override
  _RecProductsState createState() => _RecProductsState();
}

class _RecProductsState extends State<RecProducts> {
  var prodList = [
    {
      "name:": "Infernal Tides",
      "picture": "images/m0",
      "price": "2.99",
      "issue": "Issue #1",
    }

//    {
//      "name:": "Lex Luthor",
//      "picture" : "images/m1",
//      "price": "2.99",
//      "issue": "Issue #2",
//    },
//    {
//      "name:": "Red Hood Outlaw: Prince of Gotham",
//      "picture" : "images/m2",
//      "price": "2.99",
//      "issue": "Issue #3",
//    },
//    {
//      "name:": "The Avengers",
//      "picture" : "images/m3",
//      "price": "2.99",
//      "issue": "Issue #5",
//    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prodList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodName: prodList[index]['name'],
            prodPic: prodList[index]['picture'],
            prodPrice: prodList[index]['price'],
            prodIssue: prodList[index]['issue'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPic;
  final prodPrice;
  final prodIssue;

  SingleProd({
    this.prodName,
    this.prodPic,
    this.prodIssue,
    this.prodPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(
                        prodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prodPic,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
