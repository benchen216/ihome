import 'package:flutter/material.dart';
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
          children: <Widget>[
            Container(margin: EdgeInsets.only(bottom: 10.0)),
            Container(height: 200,
              child: myslider4(),
            )
            new Text("肩寬"),
            myslider(),
            new Text("胸圍"),
            myslider1(),
            new Text("腰圍"),
            myslider2(),
            new Text("臀圍"),
            myslider3(),

          ],
        ),
      ),
    );
  }
Widget myslider(){
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 15.0,
      onChanged: (newRating) {
        setState(() => _sliderValue = newRating);
      },
      value: _sliderValue,
    );
}
  Widget myslider4(){
    return new Image.network("http://140.122.162.57/myg.png");
  }
  Widget myslider2(){
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 15.0,
      onChanged: (newRating) {
        setState(() => _sliderValue2 = newRating);
      },
      value: _sliderValue2,
    );
  }
  Widget myslider3(){
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 15.0,
      onChanged: (newRating) {
        setState(() => _sliderValue3 = newRating);
      },
      value: _sliderValue3,
    );
  }
  Widget myslider1(){
    return Slider(
      activeColor: Colors.indigoAccent,
      min: 0.0,
      max: 15.0,
      onChanged: (newRating) {
        setState(() => _sliderValue1 = newRating);
      },
      value: _sliderValue1,
    );
  }
}