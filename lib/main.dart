import 'package:flash_card/constants.dart';
import 'package:flash_card/screens/new_card_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/models/newinputcard.dart';
import 'package:flutter/services.dart';

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
        primaryColor: kPrimaryColor,
        accentColor: kAccentColor,
        scaffoldBackgroundColor: kScaffoldBackColor,
        bottomAppBarColor: kAccentColor,
        appBarTheme: AppBarTheme(
          // color: Colors.red,
          backgroundColor: kScaffoldBackColor,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: kAccentColor,
          ),
          iconTheme: IconThemeData(
            color: kAccentColor,
          ),
        )
      ),
      home: NewCardPage(),
    );
  }
}


