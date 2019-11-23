import 'package:flutter/material.dart';
class RecProducts extends StatefulWidget {
  @override
  _RecProductsState createState() => _RecProductsState();
}

class _RecProductsState extends State<RecProducts> {
  var prod_list = [
    {
      "name:": "Infernal Tides",
      "picture" : "images/m0",
      "price": "2.99",
      "Issue": "Issue #1",
    },

    {
      "name:": "Lex Luthor",
      "picture" : "images/m1",
      "price": "2.99",
      "Issue": "Issue #2",
    },
    {
      "name:": "Red Hood Outlaw: Prince of Gotham",
      "picture" : "images/m2",
      "price": "2.99",
      "Issue": "Issue #3",
    },
    {
      "name:": "The Avengers",
      "picture" : "images/m3",
      "price": "2.99",
      "Issue": "Issue #5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: prod_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount
          (crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return Single_prod(
            prod_name: prod_list[index]['nsme'],
            prod_picture: prod_list[index]['picture'],
            prod_price: prod_list[index]['price'],
            prod_issue: prod_list[index]['issue'],
          );
        });

  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_issue;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_issue,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(onTap: (){},
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: ListTile(
                      leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                  child: Image.asset(prod_picture,
                    fit: BoxFit.cover,)),
            ),
          )),
    );
  }
}
