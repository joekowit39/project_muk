import 'package:flutter/material.dart';
import 'package:project_muk/src/utils/constant.dart';

import 'package:flutter/material.dart';

//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Color(0xFFC2EAF6),
//      body: ListView(
//        children: <Widget>[
//          SizedBox(height: 80,),
//          Padding(
//            padding: const EdgeInsets.only(right: 20,left: 20),
//            child: CircleAvatar(
//              backgroundImage: ExactAssetImage(Constant.IMAGE_CAR),
//              minRadius: 100,
//              maxRadius: 180,
//            ),
//          ),
//          SizedBox(height: 30,),
//          Padding(
//            padding: const EdgeInsets.only(right: 100,left: 100),
//            child: Container(
//              height: 50,
//              width: double.infinity,
//              child: RaisedButton(
//                color: Color(0xFFD56343),
//                shape: RoundedRectangleBorder(
//                  borderRadius: new BorderRadius.circular(5),
//                ),
//                child: Text(
//                  "ค้นหาร้าน",
//                  style: TextStyle(
//                      color: Colors.white,
//                      fontSize: 18,
//                      fontWeight: FontWeight.bold),
//                ),
//                onPressed: () {Navigator.pushNamed(context, Constant.PROVINCE_ROUTE);},
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BK_COLOR, //set color
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
//              color: Colors.white, //set color
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 270,
                    width: 320,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20,),
                        Image.asset(Constant.IMAGE_CAR,width: 300,),
                    SizedBox(height: 30,),
                        Text("ร้านซ่อมรถ",style: TextStyle(fontSize: 20),),
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
            ),
            SizedBox(height: 20,),
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  width: 100,
                  child: RaisedButton(
                    color: Color(0xFFD56343),//set color
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Text(
                      "ค้นหา",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {Navigator.pushNamed(context, Constant.PROVINCE_ROUTE);},
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: 200,
                  child: RaisedButton(
                    color: Color(0xFFD56300), //set color
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Text(
                      "เพิ่มข้อมูลร้านซ่อมรถ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {Navigator.pushNamed(context, Constant.LOGIN_ROUTE);},
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
