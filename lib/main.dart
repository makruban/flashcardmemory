import 'package:flash_card/screens/new_card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/models/newinputcard.dart';

void main() {
  runApp(MyApp());
}

final keyInput = GlobalKey<NewInputCardState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flash Card',
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Colors.greenAccent.shade100,
        bottomAppBarColor: Colors.purple,
        appBarTheme: AppBarTheme(
          // color: Colors.red,
          backgroundColor: Colors.greenAccent.shade100,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.purple,
          ),
          iconTheme: IconThemeData(
            color: Colors.purple,
          ),
        )
      ),
      home: NewCardPage(),
    );
  }
}


