import 'package:comic_cave/pages/product_details.dart';
import 'package:flutter/material.dart';

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
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
                    color: Colors.white,
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
