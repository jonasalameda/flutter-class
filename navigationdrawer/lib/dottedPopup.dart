import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Options { search, upload, copy, exit }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // default is 0
  var _popupMenuItemIndex = 0;
  var _changeColorMenuItem;
  var appBarHeight = AppBar().preferredSize.height;

  // build app bar
  _buildAppBar() {
    return AppBar(
      title: Text(
        "Pop up Menu",
        style: TextStyle(color: Colors.blueGrey, fontSize: 32.0),
      ),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            _onMenuItemSelected(value as int);
          },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8.0),
                bottomRight: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0)
              )
            ),
            itemBuilder: (context) => [
            // function to design each item so we can customize
              _buildPopupItem('search', Icons.search, Options.search.index),
              _buildPopupItem('upload', Icons.upload, Options.upload.index),
              _buildPopupItem('copy', Icons.copy, Options.copy.index),
              _buildPopupItem('exit', Icons.exit_to_app, Options.exit.index),
            ]
        ),
      ],
    );
  }

  PopupMenuItem _buildPopupItem(String title, IconData iconData, int position) {
    return PopupMenuItem(
      value: position,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(iconData, color: Colors.black,),
            Text(title),
          ],
         )
    );
  }

  _onMenuItemSelected (int value) {
    setState(() {
      _popupMenuItemIndex = value;
    });

    if (value == Options.search.index) {
      _changeColorMenuItem = Colors.red;
    }

    if (value == Options.upload.index) {
      _changeColorMenuItem = Colors.greenAccent;
    }

    if (value == Options.copy.index) {
      _changeColorMenuItem = Colors.blueAccent;
    }

    if (value == Options.exit.index) {
      _changeColorMenuItem = Colors.orangeAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          color: _changeColorMenuItem,
        ),
      ),
    );
  }
}
