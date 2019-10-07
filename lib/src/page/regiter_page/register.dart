import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_muk/src/utils/constant.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.BK_COLOR,
      appBar: AppBar(
        backgroundColor: Constant.ORANGE_COLOR,
        centerTitle: true,
        title: Text("login"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                    ),
                    hintText: 'กรุณาป้อนชื่อ',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'ชื่อ',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                    ),
                    hintText: 'กรุณาป้อนนามสุล',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'นามสกุล',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                    ),
                    hintText: 'กรุณาป้อนรหัสนักศึกษา',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'รหัสนักศึกษา',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                    ),
                    hintText: 'กรุณาป้อนสาขาวิชา',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'สาขาวิชา',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                    ),
                    hintText: 'กรุณาป้อนคณะ',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'คณะ',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),
                TextField(
                  decoration: new InputDecoration(
                    border: new OutlineInputBorder(),
                    hintText: 'กรุณาป้อนชั้นปี',
//              helperText: 'Keep it short, this is just a demo.',
                    labelText: 'ชั้นปี',
                    prefixIcon: const Icon(
                      Icons.person,
                    ),
                  ),
                ),
                buildSizedBox(),

                buildSizedBox(),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5),
                    ),
                    child: Text(
                      "ยืนยัน",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 13,
    );
  }
}
