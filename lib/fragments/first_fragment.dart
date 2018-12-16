import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myflutter/models/image_model.dart';

class FirstFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstFragmentState();

  }

}
class FirstFragmentState extends State<FirstFragment>{
  int counter = 0;
  List<ImageModel> images = [];
  void fetchImage () async {
    counter++;
    var response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      images.add(imageModel);
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}