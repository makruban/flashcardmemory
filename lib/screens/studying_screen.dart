import 'dart:math';

import 'package:flash_card/models/action_button.dart';
import 'package:flash_card/models/dictionary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StudyingScreen extends StatefulWidget {
  final Dictionary listOfCards;

  StudyingScreen({required this.listOfCards});

  @override
  _StudyingScreenState createState() => _StudyingScreenState();
}

class _StudyingScreenState extends State<StudyingScreen> {

  bool tabONCard = false;
  int index = 0;


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
    (MediaQuery
        .of(context)
        .size
        .height - appBar.preferredSize.height);
    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: TransformCard(
                  mediaHeight: mediaHeight,
                  textFirstSide: widget.listOfCards.dictionary[index]
                      .getFirstSide()
                      .toString(),
                  textSecondSide: widget.listOfCards.dictionary[index]
                      .getSecondSide()
                      .toString(),
                  onTapp: () {
                    setState(() {
                      tabONCard = true;
                    });
                  },
                )),
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
                    onPress: () {
                      setState(() {
                        index++;
                        tabONCard = false;


                        TransformCard(
                          mediaHeight: mediaHeight,
                          textFirstSide: widget.listOfCards.dictionary[index]
                              .getFirstSide()
                              .toString(),
                          textSecondSide: widget.listOfCards.dictionary[index]
                              .getSecondSide()
                              .toString(),
                          onTapp: () {
                            setState(() {
                              tabONCard = true;
                            });
                          },
                        );
                      });
                    },
                    color: Colors.green,
                  ),
                  ActionButton(
                    color: Colors.red,
                    mediaHeight: mediaHeight * 0.8,
                    title: 'Повторить',
                    onPress: () {
                      setState(() {
                        index++;
                      });
                    },
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

class TransformCard extends StatefulWidget {
  final double mediaHeight;
  final String textFirstSide;
  final String textSecondSide;
  final Function onTapp;
  // bool showFrontSide;

  TransformCard({required this.mediaHeight,
    required this.textFirstSide,
    required this.textSecondSide,
    required this.onTapp,
  }) {
    print('Constructor');
  }

  @override
  _TransformCardState createState() => _TransformCardState();
}

class _TransformCardState extends State<TransformCard> {
  bool? _showFrontSide = true;


  @override
  void initState() {
    super.initState();
    print('initState');
    // _showFrontSide = true;
  }


  // @override
  // void dispose() {
  //   print('dispose');
  //   _animationController.dispose();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return _buildFlipAnimation();
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: (){
        _switchCard();
        widget.onTapp();},
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: _transitionBuilder,
        child: _showFrontSide! ? _buildFirstSide() : _buildSecondSide(),
      ),
    );
  }

  void showFontSide(){
    _showFrontSide = true;
  }

  void _switchCard() {
    setState(() {
      _showFrontSide = !_showFrontSide!;
    });
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
        animation: rotateAnim,
        child: widget,
        builder: (context, widget) {
          final isUnder = (ValueKey(_showFrontSide) != widget!.key);
          var titl = ((animation.value - 0.5).abs() - 0.5) * 0.003;
          titl *= isUnder ? -1.0 : 1.0;
          final value =
          isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
          return Transform(
            transform:
            (Matrix4.rotationY(value)
              ..setEntry(3, 0, titl))
            ,
            child: widget,
            alignment: Alignment.center,
          );
        });
  }

  Widget _buildFirstSide() {
    return _buildLayout(
      key: ValueKey(true),
      // backgroundColor: Colors.blue,
      faceTitle: widget.textFirstSide);
  }

  Widget _buildSecondSide() {
    return _buildLayout(
        key: ValueKey(false),
        // backgroundColor: Colors.red,
        faceTitle: widget.textSecondSide);

  }

  Widget _buildLayout(
      {Key? key, String? faceTitle}) {
    return Container(
      margin: EdgeInsets.all(22.0
      ),
      height: widget.mediaHeight * 0.55,
      key: key,
      decoration: BoxDecoration(
        // shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        color: Theme
            .of(context).
        primaryColor,
      ),
      child: Center(
        child: Text(
          faceTitle!,
        ),
      ),
    );
  }
}