import 'package:comic_cave/pages/cart.dart';
import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  final prodDetComicId;
  final prodDetArtistId;
  final prodDetPublisher;
  final prodDetWriterId;
  final prodDetComicName;
  final prodDetPrice;
  final prodDetDesc;
  final prodDetImage;
  final prodDetQuant;
  final prodDetRelease;
  final prodDetRec;

  ProdDetails({
    this.prodDetComicId,
    this.prodDetArtistId,
    this.prodDetPublisher,
    this.prodDetWriterId,
    this.prodDetComicName,
    this.prodDetPrice,
    this.prodDetDesc,
    this.prodDetImage,
    this.prodDetQuant,
    this.prodDetRelease,
    this.prodDetRec,
  });

  @override
  _ProdDetailsState createState() => _ProdDetailsState();
}
class _ProdDetailsState extends State<ProdDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Product Details'),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 400.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.network(
                    'https://comiccave.space/uploads/${widget.prodDetImage}'),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(
                    widget.prodDetComicName,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: new Row(
                    children: <Widget>[
                      Expanded(
                        child: new Text("${widget.prodDetPrice}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: RaisedButton(
                    onPressed: () =>
                        Navigator.of(context).push(
                            new MaterialPageRoute(builder: (context) =>
                            new CartPage(
                              comicName: widget.prodDetComicName,
                              price: widget.prodDetPrice,
                            )
                            )),

                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    elevation: .2,
                    child: new Text("Add to Cart"),
                  )),
            ],
          ),
          Divider(),
          new ListTile(
            title: new Text("Summary"),
            subtitle: new Text(widget.prodDetDesc),
          ),
          Divider(),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Artist:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.prodDetArtistId),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Writer:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.prodDetWriterId),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text(
                  "Publisher:",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.prodDetPublisher),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
