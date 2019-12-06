import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product_details.dart';

class SearchPage extends StatefulWidget {
  // ExamplePage({ Key key }) : super(key: key);
  @override
  _SearchPageState createState() => new _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _filter = new TextEditingController();
  var data;
  String _searchText = "";
  List names = new List();
  List filteredNames = new List();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Browse');

  _SearchPageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    this._getNames();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: Container(
        child: _buildList(),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      elevation: 0.0,
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,

      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = new List();
      for (int i = 0; i < filteredNames.length; i++) {
        if (filteredNames[i]['comic_name'].toLowerCase().contains(
            _searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return GridView.builder(
      itemCount: names == null ? 0 : filteredNames.length,
      gridDelegate:
      new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return new SingleProd(
          prodComicId: filteredNames[index]['comic_id'],
          prodArtistId: filteredNames[index]['artist_id'],
          prodPublisher: filteredNames[index]['publisher_id'],
          prodWriterId: filteredNames[index]['writer_id'],
          prodComicName: filteredNames[index]['comic_name'],
          prodPrice: filteredNames[index]['price'],
          prodDesc: filteredNames[index]['description'],
          prodImage: filteredNames[index]['cover_image'],
          prodQuant: filteredNames[index]['quantity'],
          prodRelease: filteredNames[index]['released'],
          prodRec: filteredNames[index]['recommended'],
        );
      },
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Browse');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  Future _getNames() async {
    List tempLiat = new List();
    http.Response response = await http.get(
        "https://comic-cave.space/app/get.php");
    data = json.decode(response.body);


    setState(() {
      names = data;
      filteredNames = names;
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
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
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
                    'https://comic-cave.space/uploads/$prodImage',
                    fit: BoxFit.fill,
                  )),
            ),
          )),
    );
  }
}