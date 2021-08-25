import 'package:flash_card/constants.dart';
import 'package:flash_card/dictionary_list.dart';
import 'package:flash_card/main.dart';
import 'package:flash_card/models/redictioncontainer.dart';
import 'package:flash_card/screens/choose_side_page.dart';
import 'package:flutter/material.dart';

import '../models/newinputcard.dart';
import '../models/dictionary.dart';
import '../models/flash_card.dart';

class NewCardPage extends StatelessWidget {

  final Dictionary storeOfCard = Dictionary();
  final AppBar appBarchik = AppBar(
    elevation: kAppBarElevation,
    // backgroundColor: Colors.white,
    // centerTitle: true,
    title: Text(
      'Новая карточка',
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
    // leading: Icon(
    //   Icons.menu,
    //   // color: Colors.blueAccent,
    // ),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15.0),
        child: IconButton(
          tooltip: 'добавить карту в словарь',
          icon: const Icon(
            Icons.add,
            // color: Colors.blueAccent,
          ),
          onPressed: () {
            keyInput.currentState?.addNewInputCard();
            keyInput.currentState?.validateForm();
          },
        ),
      ),
    ],
  );

  void addNewCard(String firstSideText, String secondSideText) {
    FlashCard newAddCard = FlashCard(
      firstSide: firstSideText,
      secondSide: secondSideText,
    );
    storeOfCard.dictionary.add(newAddCard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarchik,
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
              child: Text(
                'Настройки',
              ),
            ),
            ListTile(
              title: Text(
                'Line 1',
              ),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: Text(
                'Line 2',
              ),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: HomePageBody(
          addNewCard: addNewCard,
          appBar: appBarchik,
          storeOfCards: storeOfCard,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_rounded),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DictionaryList(
                  listDictionary: storeOfCard,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  final Function addNewCard;
  final AppBar appBar;
  final Dictionary storeOfCards;

  HomePageBody({required this.addNewCard, required this.appBar, required this.storeOfCards});

  @override
  Widget build(BuildContext context) {
    final mediaHeight =
        (MediaQuery.of(context).size.height - appBar.preferredSize.height);

    return Column(
      children: [
        Container(
          height: mediaHeight * 0.55,
          margin: EdgeInsets.all(22.0),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            // border: Border.all(
            //   color: Colors.black87,
            // ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: kBoxShadow,
          ),
          child: NewInputCard(
            addNewCard: addNewCard,
            keyInput: keyInput,
            // newInputDictionary: newDictionary,
          ),
        ),
        GestureDetector(
          child: Container(
            height: mediaHeight * 0.29,
            child: Stack(
              children: [
                // Container(),
                ReDictionContainer(
                  marginContainer: EdgeInsets.only(
                      left: 38.0, right: 62.0, top: 42.0, bottom: 18.0),
                  boxShadowList: kBoxShadow,
                ),
                ReDictionContainer(
                  marginContainer: EdgeInsets.only(
                      left: 44.0, right: 56.0, top: 36.0, bottom: 24.0),
                ),
                ReDictionContainer(
                  marginContainer: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                  child: Stack(
                    children: [
                      Container(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: FittedBox(
                                child: Text(
                                  'Deutsch',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    'глаголы',
                                    style: TextStyle(
                                        // fontSize: 5.0,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 120, vertical: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.grey,
                                ),
                                child: FittedBox(
                                  child: Text(
                                    '6122',
                                    style: TextStyle(
                                      fontSize: kDictionaryAmountSize,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        // height: 20,
                        top: -10,
                        right: -20,
                        width: 45.0,
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.red,
                          ),
                          child: FittedBox(
                            child: Text(
                              '6',
                              style: TextStyle(
                                fontSize: kDictionaryAmountSize,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                    // overflow: Overflow.visible,
                    clipBehavior: Clip.none,
                    alignment: AlignmentDirectional.topEnd,
                  ),
                ),
              ],
            ),
          ),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSidePage(listOfCards: storeOfCards,),),
        ),),
        Container(
          height: mediaHeight * 0.07,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ],
    );
  }
}


