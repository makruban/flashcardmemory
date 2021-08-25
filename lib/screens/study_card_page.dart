import 'dart:math';

import 'package:flash_card/models/ActionButton.dart';
import 'package:flash_card/models/dictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudyCardPage extends StatefulWidget {
  final Dictionary listOfCards;

  StudyCardPage({required this.listOfCards});

  @override
  _StudyCardPageState createState() => _StudyCardPageState();
}

class _StudyCardPageState extends State<StudyCardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;
  bool tabONCard = false;
  int index = 0;


  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  AppBar appBar = AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text(
      'Deutsch',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final mediaHeight =
        (MediaQuery.of(context).size.height - appBar.preferredSize.height);
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(pi * _animation.value),
                    child: GestureDetector(
                      onTap: () {
                        if (_animationStatus == AnimationStatus.dismissed) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                        setState(() {
                          tabONCard = true;
                        });
                      },
                      child: _animation.value < 0.5
                          ? Container(
                              height: mediaHeight * 0.55,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.all(22.0),
                              child: Center(
                                child: Text(
                                  widget.listOfCards.dictionary[index]
                                      .getFirstSide()
                                      .toString(),
                                ),
                              ),
                            )
                          : Container(
                              height: mediaHeight * 0.55,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: EdgeInsets.all(22.0),
                              child: Center(
                                child: Text(
                                  widget.listOfCards.dictionary[index]
                                      .getSecondSide()
                                      .toString(),
                                ),
                              ),
                            ),
                    ),
                  ),
              ),

            // SizedBox(
            //   height: mediaHeight * 0.05,
            // ),
            Container(
              // margin: EdgeInsets.all(22.0),
              height: mediaHeight * 0.30,
              child: tabONCard
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionButton(
                          mediaHeight: mediaHeight * 0.8,
                          title: 'Помню',
                          onPress: () {setState(() {
                            index++;
                            tabONCard = false;

                          });},
                          color: Colors.green,
                        ),
                        ActionButton(
                          color: Colors.red,
                          mediaHeight: mediaHeight * 0.8,
                          title: 'Повторить',
                          onPress: () {setState(() {
                            index++;
                          });},
                        ),
                      ],
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
