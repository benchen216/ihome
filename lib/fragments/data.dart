import 'package:flutter/material.dart';
import 'package:ihome/app.dart';
class DataOld extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DataOldState();
  }

}
class DataOldState extends State<DataOld>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: Text("詳細資料",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: new Image.network("https://safenology.idv.tw/ben/data.png"),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("身高："),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("體重："),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("BMI："),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("病歷："),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("緊急事項："),
              margin: EdgeInsets.all(10.0),
            ),
            new Container(
              child: Text("call："),
              margin: EdgeInsets.all(10.0),
            ),
          ],
        )
    );
  }
}