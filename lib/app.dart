import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' show get;

class App extends StatefulWidget{
  final drawerItems = [
    new DrawerItem("Fragment 1", Icons.rss_feed),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ];
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AppState();

  }

}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}
class AppState extends State<App>{
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
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            //selected: i == _selectedDrawerIndex,
            //onTap: () => _onSelectItem(i),
          )
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFF673AB7),
          title: Text("here"),
        ),
          drawer: new Drawer(
            child: new Column(
              children: <Widget>[
                new UserAccountsDrawerHeader(
                    accountName: new Text("John Doe"), accountEmail: null),
                new Column(children: drawerOptions)
              ],
            ),
          )
      ),
    );
  }



}