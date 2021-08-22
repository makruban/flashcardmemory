import 'package:flash_card/models/dictionary.dart';
import 'package:flash_card/models/flash_card.dart';
import 'package:flutter/material.dart';

class DictionaryList extends StatefulWidget {
  final Dictionary listDictionary;

  DictionaryList({required this.listDictionary});

  @override
  _DictionaryListState createState() => _DictionaryListState();
}

class _DictionaryListState extends State<DictionaryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 9,
            child: Container(
              child: ListView(
                children: [
                  Column(
                    children: widget.listDictionary.dictionary.map(
                      (crd) {
                        return Card(
                          color: Theme.of(context).primaryColor,
                          elevation: 6.0,
                          margin: EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'id: ${crd.getID()}',
                                    ),

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Deutsch',
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {

                                          widget.listDictionary.dictionary.removeWhere((element) => element.getID() == crd.getID());
                                        });
                                      },

                                      icon: Icon(
                                        Icons.delete_outline_sharp,
                                        color: Colors.red,
                                        // size: 18.0,
                                      ),
                                      // iconSize: 15.0,
                                    ),
                                  ],
                                ),
                                Card(

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        crd.getFirstSide()!,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                      Divider(),
                                      Text(
                                        crd.getSecondSide()!,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  elevation: 3,
                                ),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                    ('Дата создания: ${crd.getDateTime().toString()}'),
                                    ),
                                    Text(
                                      'Период: 3',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green.shade200,
              width: double.infinity,
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Всего карточек: ${FlashCard.count}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Всего словарей: 2',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(Icons.keyboard_backspace_outlined),
      ),
    );
  }
}
