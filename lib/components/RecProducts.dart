import 'package:flutter/material.dart';

class RecProducts extends StatefulWidget {
  @override
  _RecProductsState createState() => _RecProductsState();
}

class _RecProductsState extends State<RecProducts> {
  var prodList = [
    {
      "name": "Infernal Tides",
      "picture": "images/m0.PNG",
      "price": "2.99"
    },
    {
      "name": "Red Hood Outlaw",
      "picture": "images/m2.PNG",
      "price": "2.99",
    },
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
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPic;
  final prodPrice;

  SingleProd({
    this.prodName,
    this.prodPic,
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
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prodName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
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
