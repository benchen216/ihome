import 'package:flutter/material.dart';
class Wellcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        child: new Image.network("http://140.122.162.57/my.png"),
      ),//Image.network("http:140.122.162.57/my.png"),
    );
  }

}