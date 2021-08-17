import 'package:flash_card/models/dictionary.dart';
import 'package:flash_card/models/new_card.dart';
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
                          color: Colors.yellow,
                          elevation: 6.0,
                          margin: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'номер: ${crd.getDateTime()}',
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
                              Text(
                                'Deutsch',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                crd.getFirstSide()!,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Text(
                                crd.getSecondSide()!,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    crd.getDateTime().toString(),
                                  ),
                                  Text(
                                    'Переодичность: 3',
                                  ),
                                ],
                              ),
                            ],
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
                    'Всего карточек: ${NewCard.count}',
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
