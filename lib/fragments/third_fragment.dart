import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ThirdFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ThirdFragmentState();
  }

}
class ThirdFragmentState extends State<ThirdFragment> {
  double _sliderValue = 10.0;
  double _sliderValue1 = 5.0;
  double _sliderValue2= 7.0;
  double _sliderValue3 = 15.0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: Text("警急事項",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            new GestureDetector(
              onTap: (){
              },
              child:
              new Container(
                child: Row(
                    children:<Widget>[
                      new Container(
                        child: new Image.network("https://safenology.idv.tw/ben/110.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("確認家人狀況"),
                      Spacer(),
                      Icon(Icons.info_outline),
                    ]
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ),
            new GestureDetector(
              onTap: (){
                launch("tel://0937158665");
              },
              child:
              new Container(
                child: Row(
                    children:<Widget>[
                      new Container(
                        child: new Image.network("https://safenology.idv.tw/ben/119.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("119,110"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ),
            new GestureDetector(
              onTap: (){
                print("Container clicked");
              },
              child:
              new Container(
                child: Row(
                    children:<Widget>[
                      new Container(
                        child: new Image.network("https://safenology.idv.tw/ben/110.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("通知其他家人"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}