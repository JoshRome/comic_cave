import 'package:flutter/material.dart';

class ProdDetails extends StatefulWidget {
  final prodDetName;
  final prodDetImage;
  final prodDetPrice;
  final prodDetBrand;
  final prodDetArtist;
  final prodDetWriter;
  final prodDetDescription;

  ProdDetails(
      {this.prodDetName,
      this.prodDetImage,
      this.prodDetPrice,
      this.prodDetBrand,
      this.prodDetArtist,
      this.prodDetWriter,
      this.prodDetDescription});

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
                child: Image.asset(widget.prodDetImage),
              ),
              footer: new Container(
                color: Colors.white,
                child: ListTile(
                  leading: new Text(
                    widget.prodDetName,
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
                  child: MaterialButton(
                onPressed: () {},
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
            subtitle: new Text(widget.prodDetDescription),
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
                child: new Text(widget.prodDetArtist),
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
                child: new Text(widget.prodDetWriter),
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
                child: new Text(widget.prodDetBrand),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
