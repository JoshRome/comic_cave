import 'package:comic_cave/pages/product_details.dart';
import 'package:flutter/material.dart';
class RecProducts extends StatefulWidget {
  @override
  _RecProductsState createState() => _RecProductsState();
}

class _RecProductsState extends State<RecProducts> {
  var prodList = [
    {
      "name": "Dungeons and Dragons: Infernal Tides",
      "picture": "images/m0.PNG",
      "price": "2.99",
      "brand": "Dungeons and Dragons",
      "writer": "Jim Zub",
      "artist": "Max Dunbar",
      "description": "In Infernal Tides, fan-favorite Minsc and his friends are caught in the middle of devil-tainted corruption that has taken hold of Baldur’s Gate. Unravelling the secret of its source will take the heroes to unexpected places and threaten the sanctity of their very souls. Even if they survive this perilous journey, there will be Hell to pay!"
    },
    {
      "name": "Red Hood Outlaw: Prince of Gotham",
      "picture": "images/m2.PNG",
      "price": "16.99",
      "brand": "DC",
      "writer": "Scott Lobdell",
      "artist": "Pete Woodd",
      "description": "The Outlaws never thought things would look this bad, as Jason Todd gives in to his addiction to Venom in order to find the missing Starfire in Red Hood: Outlaw Vol. 2: Prince of Gotham! "
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
              prodBrand: prodList[index]['brand'],
              prodWriter: prodList[index]['writer'],
              prodArtist: prodList[index]['artist'],
              prodDescription: prodList[index]['description']
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodName;
  final prodPic;
  final prodPrice;
  final prodBrand;
  final prodWriter;
  final prodArtist;
  final prodDescription;

  SingleProd({
    this.prodName,
    this.prodPic,
    this.prodPrice,
    this.prodBrand,
    this.prodWriter,
    this.prodArtist,
    this.prodDescription
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context) =>
                      new ProdDetails(
                        // Passing in values of products
                        prodDetName: prodName,
                        prodDetImage: prodPic,
                        prodDetPrice: prodPrice,
                        prodDetBrand: prodBrand,
                        prodDetArtist: prodArtist,
                        prodDetWriter: prodWriter,
                        prodDetDescription: prodDescription,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child: new Row(children: <Widget>[
                      Expanded(
                        child: Text(prodName, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),),
                      ),
                    ],
                    ),
                  ),
                  child: Image.asset(
                    prodPic,
                    fit: BoxFit.fill,
                  )),
            ),
          )),
    );
  }
}
