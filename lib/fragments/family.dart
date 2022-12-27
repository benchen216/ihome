import 'package:flutter/material.dart';
class OldMan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OldManSate();
  }

}
class OldManSate extends State<OldMan>{
  int x = 0;
  _testY(y){
    setState(() {
      x=y;
      print(x);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: Text("家人",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            new GestureDetector(
              onTap: (){
                _testY(4);
              },
              child:
              new Container(
                child: Row(
                    children:<Widget>[
                      new Container(
                        child: new Image.network("https://safenology.idv.tw/ben/oldman.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("爸爸 ＸＸＸ"),
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
                        child: new Image.network("https://safenology.idv.tw/ben/oldwoman.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("媽媽 ＸＸＸ"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ),
          ],
        )
    );
  }
  Widget get_my(x){
    switch (x) {
      case 0:
        return new GestureDetector(
            onTap: (){
              _testY(1);
            },
            child:Text("54333"),
        );
      case 1:
        return new Text("543");
    }
  }
}
/*
new Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Container(
              child: Text("家人",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 2.0),
              ),
              margin: EdgeInsets.all(10.0),
            ),
            new GestureDetector(
              onTap: (){
                _testY(4);
              },
              child:
              new Container(
                child: Row(
                    children:<Widget>[
                      new Container(
                        child: new Image.network("https://safenology.idv.tw/ben/oldman.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("爸爸 ＸＸＸ"),
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
                        child: new Image.network("https://safenology.idv.tw/ben/oldwoman.png"),
                        margin: EdgeInsets.all(10.0),
                        height: 100,
                        width: 100,
                      ),
                      Text("媽媽 ＸＸＸ"),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios),
                    ]
                ),
                margin: EdgeInsets.all(10.0),
              ),
            ),
          ],
        )
    );
 */