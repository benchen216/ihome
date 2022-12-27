import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ihome/fab_bottom_app_bar.dart';
import 'package:ihome/fab_with_icons.dart';
import 'package:ihome/fragments/example_8.dart';
import 'package:ihome/fragments/first_fragment.dart';
import 'package:ihome/fragments/habit.dart';
import 'package:ihome/fragments/login_screen.dart';
import 'package:ihome/fragments/register_screen.dart';
import 'package:ihome/fragments/remind.dart';
import 'package:ihome/fragments/second_fragment.dart';
import 'package:ihome/fragments/slidertest.dart';
import 'package:ihome/fragments/third_fragment.dart';
import 'package:ihome/fragments/wellcome.dart';
import 'package:ihome/fragments/data.dart';
import 'package:ihome/fragments/family.dart';
import 'package:ihome/layout.dart';
import 'models/image_model.dart';
import 'widgets/image_list.dart';
import 'package:http/http.dart' show get;

class MyApp extends StatefulWidget{
  final drawerItems = [
    new DrawerItem("登入", Icons.home),
    new DrawerItem("生活習慣", Icons.arrow_back),
    new DrawerItem("建立帳號", Icons.add),
    new DrawerItem("警急聯絡", Icons.person),
    new DrawerItem("詳細資料", Icons.local_see),
    new DrawerItem("家人", Icons.local_see),
    new DrawerItem("提醒事項", Icons.book),
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
  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }
  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new LoginScreen();
      case 1:
        return new Habit();
      case 2:
        return new RegisterScreen();
      case 3 :
        return new ThirdFragment();
      case 4 :
        return new DataOld();
      case 5 :
        return new OldMan();
      case 6 :
        return new Remind();
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
        body: _getDrawerItemWidget(_selectedDrawerIndex),
        /*floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,

        ),*/
        appBar: AppBar(
          backgroundColor: Color(0xff5c6bc0),
          title: Text("ihome"),
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
        /*bottomNavigationBar: FABBottomAppBar(
          centerItemText: '添加',
          color: Colors.grey,
          selectedColor: Colors.red,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _selectedTab,
          items: [
            FABBottomAppBarItem(iconData: Icons.star, text: '首頁'),
            FABBottomAppBarItem(iconData: Icons.account_circle, text: '我的衣櫥'),
            FABBottomAppBarItem(iconData: Icons.dashboard, text: '搭配'),
            FABBottomAppBarItem(iconData: Icons.collections, text: '收集'),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: _buildFab(
            context),*/
      ),
    );
  }
  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.collections, Icons.camera_alt, Icons.search ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }


}