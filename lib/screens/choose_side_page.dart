import 'package:flash_card/models/ActionButton.dart';
import 'package:flash_card/models/dictionary.dart';
import 'package:flash_card/models/selected_side_card.dart';
import 'package:flash_card/screens/study_card_page.dart';
import 'package:flutter/material.dart';

class ChooseSidePage extends StatelessWidget {

  final Dictionary listOfCards;

  ChooseSidePage({required this.listOfCards});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Deutsch',
        ),
        centerTitle: true,
      ),
      body: PickSide(listOfCards: listOfCards,),
    );
  }
}

class PickSide extends StatefulWidget {

  Dictionary listOfCards;

  PickSide({required this.listOfCards});

  @override
  _PickSideState createState() => _PickSideState();
}

class _PickSideState extends State<PickSide> {
  SelectedSideCard? selectedSideCard;

  @override
  Widget build(BuildContext context) {
    Color activeButtonColor = Theme
        .of(context)
        .primaryColor;
    Color inactiveButtonColor = Colors.grey.shade300;
    return Container(
      // padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: ReusableSelectButton(
                textLine: 'Показывать только переднюю',
                selectedSideCard: selectedSideCard,
                onPress: () {
                  setState(() {
                    selectedSideCard = SelectedSideCard.firstSide;
                  });
                },
                backgroundSelectedCard:
                selectedSideCard == SelectedSideCard.firstSide
                    ? activeButtonColor
                    : inactiveButtonColor,
              ),
            ),
          ),
          // SizedBox(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: ReusableSelectButton(
                textLine: 'Показывать только заднюю',
                selectedSideCard: selectedSideCard,
                onPress: () {
                  setState(() {
                    selectedSideCard = SelectedSideCard.secondSide;
                  });
                },
                backgroundSelectedCard:
                selectedSideCard == SelectedSideCard.secondSide
                    ? activeButtonColor
                    : inactiveButtonColor,
              ),
            ),
          ),

          // SizedBox(),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: ReusableSelectButton(
                textLine: 'Случайно',
                selectedSideCard: selectedSideCard,
                onPress: () {
                  setState(() {
                    selectedSideCard = SelectedSideCard.randomSide;
                  });
                },
                backgroundSelectedCard:
                selectedSideCard == SelectedSideCard.randomSide
                    ? activeButtonColor
                    : inactiveButtonColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0, top: 10.0),
              child: ActionButton(
                mediaHeight: 1,
                title: 'Поехали',
                color: selectedSideCard == null ? Colors.grey.shade300 : Colors.green,
                onPress: selectedSideCard == null ? (){} : () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudyCardPage(listOfCards: widget.listOfCards,),),);
        },
              ),
            ),
            // child: Padding(
            //   padding: const EdgeInsets.all(28.0),
            //   child: ElevatedButton(
            //     child: Text(
            //       'Поехали',
            //     ),
            //     onPressed: selectedSideCard == null ? (){} : () {
            //       Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => StudyCardPage(),),);
            //     },
            //     style: ElevatedButton.styleFrom(
            //       primary: selectedSideCard == null ? Colors.grey.shade300 : Theme
            //           .of(context)
            //           .accentColor,
            //       elevation: 8.0,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

class ReusableSelectButton extends StatelessWidget {
  const ReusableSelectButton({
    required this.selectedSideCard,
    required this.onPress,
    required this.textLine,
    required this.backgroundSelectedCard,
  });

  final SelectedSideCard? selectedSideCard;
  final Function()? onPress;
  final String textLine;
  final Color backgroundSelectedCard;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        textLine,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundSelectedCard,
        ),
        elevation: MaterialStateProperty.all(8.0),
        // side: MaterialStateProperty.all(
        //   BorderSide(
        //     color: Colors.black,
        //   ),
        // ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38.0),
          ),
        ),
      ),
    );
  }
}
