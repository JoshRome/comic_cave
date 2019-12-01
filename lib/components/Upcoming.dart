import 'dart:async';
import 'dart:convert';

import 'package:comic_cave/pages/product_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  var data;
  var pics;
  List userPics;
  List userData;

  Future getData() async {
    http.Response response = await http.get(
        "https://comiccave.space/app/rel.php");
    //http.Response resp = await http.get("https://comiccave.space/uploads/1");
    data = json.decode(response.body);
    //pics = json.decode(resp.body);
    //debugPrint(response.body);
    setState(() {
      userData = data;
      //userPics = pics;
//      print(userData);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: userData == null ? 0 : userData.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProd(
            prodComicId: userData[index]['comic_id'],
            prodArtistId: userData[index]['artist_id'],
            prodPublisher: userData[index]['publisher_id'],
            prodWriterId: userData[index]['writer_id'],
            prodComicName: userData[index]['comic_name'],
            prodPrice: userData[index]['price'],
            prodDesc: userData[index]['description'],
            prodImage: userData[index]['cover_image'],
            prodQuant: userData[index]['quantity'],
            prodRelease: userData[index]['released'],
            prodRec: userData[index]['recommended'],
          );
        });
  }
}

class SingleProd extends StatelessWidget {
  final prodComicId;
  final prodArtistId;
  final prodPublisher;
  final prodWriterId;
  final prodComicName;
  final prodPrice;
  final prodDesc;
  final prodImage;
  final prodQuant;
  final prodRelease;
  final prodRec;


  SingleProd({
    this.prodComicId,
    this.prodArtistId,
    this.prodPublisher,
    this.prodWriterId,
    this.prodComicName,
    this.prodPrice,
    this.prodDesc,
    this.prodImage,
    this.prodQuant,
    this.prodRelease,
    this.prodRec,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodComicName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) =>
                new ProdDetails(
                  // Passing in values of products
                  prodDetComicId: prodComicId,
                  prodDetArtistId: prodArtistId,
                  prodDetPublisher: prodPublisher,
                  prodDetWriterId: prodWriterId,
                  prodDetComicName: prodComicName,
                  prodDetPrice: prodPrice,
                  prodDetDesc: prodDesc,
                  prodDetImage: prodImage,
                  prodDetQuant: prodQuant,
                  prodDetRelease: prodRelease,
                  prodDetRec: prodRec,
                ),
              )),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            prodComicName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: Image.network(
                    'https://comiccave.space/uploads/$prodImage',
                    fit: BoxFit.fill,
                  )),
            ),
          )),
    );
  }
}
