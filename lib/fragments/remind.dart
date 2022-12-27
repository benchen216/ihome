import 'package:flutter/material.dart';

class Remind extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RemindState();
  }
}
class RemindState extends State<Remind>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: Text("提醒事項",
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
                        child: new Image.network("https://safenology.idv.tw/ben/remind1.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("三餐定時吃藥"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(5.0),
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
                        child: new Image.network("https://safenology.idv.tw/ben/remind2.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("多穿衣服"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(5.0),
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
                        child: new Image.network("https://safenology.idv.tw/ben/remind3.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("吃飯時間到了"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(5.0),
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
                        child: new Image.network("https://safenology.idv.tw/ben/remind4.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("電器記得關"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(5.0),
              ),
            ),
          ],
        )
    );
  }

}