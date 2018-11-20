import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();
  }

}
class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage () async {
    counter++;
    var response = await get('https://jsonplacehoder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    images.add(imageModel);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Text('$counter'),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF673AB7),
          title: Text("here"),
        ),
      ),
    );
  }



}