import 'package:comic_cave/pages/product_details.dart';
import 'package:flutter/material.dart';

class BrowseProducts extends StatefulWidget {
  @override
  _BrowseProductsState createState() => _BrowseProductsState();
}

class _BrowseProductsState extends State<BrowseProducts> {
  var prodList = [
    {
      "name": "Year of the Villain: Lex Luthor",
      "picture": "images/m1.PNG",
      "price": "4.99",
      "brand": "DC",
      "writer": "Jason Latour",
      "artist": "Bryan Hitch ",
      "description":
          "Apex Lex has made his offer to the villains of the DC Universe...but has the super-powered evil genius gotten what he truly desires? The most deadly predator in the Multiverse has set out to answer that question by seeking out his counterparts on other Earths. But will this meeting of the Luthors be the greatest team-up in all of creation...or end in a bloodbath?"
    },
    {
      "name": "The Avengers",
      "picture": "images/m3.PNG",
      "price": "2.99",
      "brand": "Marvel",
      "writer": "Jason Aaron",
      "artist": "Ed McGuinness",
      "description":
          "Thor Odinson. Steve Rogers. Tony Stark. The Big Three of the Avengers are reunited at last! And just in time to save the world from total annihilation at the hands of their most powerful enemies yet: the 2000-foot-tall space gods known as Celestials. Behold the coming of the Final Host. Who will answer the call to assemble for a wild new era of Earth’s Mightiest Heroes? Hint: one of them has a flaming skull for a head. And what strange, world-shaking connection exists between the Final Host and Odin’s ancient band of Prehistoric Avengers?"
    },
    {
      "name": "Dungeons and Dragons: Infernal Tides",
      "picture": "images/m0.PNG",
      "price": "2.99",
      "brand": "Dungeons and Dragons",
      "writer": "Jim Zub",
      "artist": "Max Dunbar",
      "description":
          "In Infernal Tides, fan-favorite Minsc and his friends are caught in the middle of devil-tainted corruption that has taken hold of Baldur’s Gate. Unravelling the secret of its source will take the heroes to unexpected places and threaten the sanctity of their very souls. Even if they survive this perilous journey, there will be Hell to pay!"
    },
    {
      "name": "Red Hood Outlaw: Prince of Gotham",
      "picture": "images/m2.PNG",
      "price": "16.99",
      "brand": "DC",
      "writer": "Scott Lobdell",
      "artist": "Pete Woodd",
      "description":
          "The Outlaws never thought things would look this bad, as Jason Todd gives in to his addiction to Venom in order to find the missing Starfire in Red Hood: Outlaw Vol. 2: Prince of Gotham! "
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
              prodDescription: prodList[index]['description']);
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

  SingleProd(
      {this.prodName,
      this.prodPic,
      this.prodPrice,
      this.prodBrand,
      this.prodWriter,
      this.prodArtist,
      this.prodDescription});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new ProdDetails(
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
                    color: Colors.white70,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            prodName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
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
