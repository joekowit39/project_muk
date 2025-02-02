import 'package:flutter/material.dart';
import 'package:project_muk/src/mode_view/province_model_view.dart';
import 'package:project_muk/src/model/store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_muk/src/page/location_detali_page/location_detail.dart';
import 'package:project_muk/src/utils/constant.dart';


class NameShopPage extends StatefulWidget {
  NameShopPage({Key key, this.provinceName, this.provinceId}) : super(key: key);

  final String provinceName;
  final String provinceId;

  @override
  _State createState() => _State();
}

class _State extends State<NameShopPage> {
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
        body: StreamBuilder<QuerySnapshot>(
          stream: Firestore.instance
              .collection('store')
              .where('address.districts_id', isEqualTo: widget.provinceId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: new Text('Loading...',style: TextStyle(color: Colors.white)));
              default:
                return new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new ListTile(
                      leading: Icon(Icons.store_mall_directory,color: Colors.white,size: 30,),//icon
                      trailing: Icon(Icons.keyboard_arrow_right,color: Colors.white,),
                      title: new Text(
                        document['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationDetailPage(
                                    provinceName: document['name'],
                                    provinceId: document.documentID,
                                    itemImage: document['images'][0]['src'],
                                    itemAddress: document['address']['detail'],
                                    itemTel: document['contact']['mobilePhone'],
                                    itemDescription: document['description'],
                                    itemTime: document['open']['time'],
                                    itemLat: document['location']['lat'],
                                    itemLng: document['location']['lng'],
                                  )),
                        );
                      },
                    );
                  }).toList(),
                );
            }
          },
        ));
  }
}
