import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_muk/src/mode_view/province_model_view.dart';
import 'package:project_muk/src/utils/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationDetailPage extends StatefulWidget {
  LocationDetailPage({
    Key key,
    this.provinceName,
    this.provinceId,
    this.itemImage,
    this.itemAddress,
    this.itemTel,
    this.itemDescription,
    this.itemTime,
    this.itemLat,
    this.itemLng,
  }) : super(key: key);

  final String provinceName;
  final String provinceId;
  final String itemImage;
  final String itemAddress;
  final String itemTel;
  final String itemDescription;
  final String itemTime;
  final String itemLat;
  final String itemLng;

  @override
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  ProvinceViewModel menuItem;

  @override
  void initState() {
    menuItem = ProvinceViewModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BK_COLOR,
      appBar: AppBar(
        backgroundColor: Constant.ORANGE_COLOR,
        centerTitle: true,
        title: Text(widget.provinceName),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: widget.itemImage,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "ชื่อร้าน",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.store),
                              SizedBox(
                                width: 5,
                              ),
                              Text("${widget.provinceName}",
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            "ที่อยู่",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.home),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: Text(widget.itemAddress,
                                      style: TextStyle(color: Colors.black))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            "โทร",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.call),
                              SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    normal('tel://${widget.itemTel}');
                                  },
                                  child: Text(widget.itemTel,
                                      style: TextStyle(color: Colors.black))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            "รายละเอียด",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.library_books),
                              SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                  child: Text(widget.itemDescription,
                                      style: TextStyle(color: Colors.black))),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: Divider(
                              height: 2,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Text(
                            "รายละเอียด",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.access_time),
                              SizedBox(
                                width: 5,
                              ),
                              Text(widget.itemTime,
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Constant.ORANGE_COLOR,
        onPressed: () {
          _openGoogleMap(lat: widget.itemLat, lng: widget.itemLng);
        },
        tooltip: 'นำทาง',
        child: Icon(Icons.location_on),
      ),
    );
  }
}

normal(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future _openGoogleMap({String lat, String lng}) async {
  String googleUrl = 'comgooglemaps://?z=12&q=$lat,$lng';
  String appleUrl = 'https://maps.apple.com/?z=12&q=$lat,$lng';
  if (await canLaunch("comgooglemaps://")) {
    print('launching com googleUrl');
    await launch(googleUrl);
  } else if (await canLaunch(appleUrl)) {
    print('launching apple url');
    await launch(appleUrl);
  } else {
    throw 'Could not launch url';
  }
  launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
