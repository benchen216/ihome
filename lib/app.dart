import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myflutter/fragments/first_fragment.dart';
import 'package:myflutter/fragments/login_screen.dart';
import 'package:myflutter/fragments/second_fragment.dart';
import 'package:myflutter/fragments/third_fragment.dart';
import 'package:myflutter/fragments/wellcome.dart';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' show get;

class MyApp extends StatefulWidget{
  final drawerItems = [
    new DrawerItem("歡迎畫面", Icons.home),
    new DrawerItem("登陸", Icons.arrow_back),
    new DrawerItem("建立帳號", Icons.add),
    new DrawerItem("Fragment 2", Icons.local_see),
    new DrawerItem("Fragment 3", Icons.inbox)
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
class AppState extends State<MyApp>{
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new Wellcome();
      case 1:
        return new LoginScreen();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }
  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }
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
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: _getDrawerItemWidget(_selectedDrawerIndex),//ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff5c6bc0),
          title: Text("Sranko"),
        ),
          drawer: new Drawer(
            child: Container(
              color: Color(0xFFF3E5F5),
              child: new Column(
                children: <Widget>[
                  new UserAccountsDrawerHeader(
                      accountName: new Text("beta test"), accountEmail: null,decoration: BoxDecoration(
                    color: const Color(0xFFE1BEE7),
                    image: DecorationImage(
                      image: ExactAssetImage('images/flowers.png'),
                      fit: BoxFit.cover,
                    ),
                  ), ),
                  new Column(children: drawerOptions)
                ],
              ),
            ),
            ),
        bottomNavigationBar: Text(""),
      ),
    );
  }



}