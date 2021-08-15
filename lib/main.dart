import 'package:flash_card/new_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flash Card',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  NewCard newCard = NewCard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Новая карточка',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.blueAccent,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: TextButton(
              child: Icon(
                Icons.post_add_sharp,
                color: Colors.blueAccent,
              ),
              onPressed: () => newCard.printValue(),
            ),
          ),
        ],
      ),
      body: HomePageBody(
        newCardBody: newCard,
      ),
    );
  }
}

class HomePageBody extends StatelessWidget {
  NewCard newCardBody = NewCard();
  HomePageBody({required this.newCardBody});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: EdgeInsets.all(22.0),
            decoration: BoxDecoration(
              color: Colors.yellow,
              // border: Border.all(
              //   color: Colors.black87,
              // ),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(1.0, 2.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: NewInputCard(
              newCardInput: newCardBody,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(
                    left: 38.0, right: 62.0, top: 42.0, bottom: 18.0),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1.0, 3.0),
                        blurRadius: 6.0,
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: 44.0, right: 56.0, top: 36.0, bottom: 24.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.yellow,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.yellow,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          'Deutsch',
                          style: TextStyle(
                            fontSize: 50.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'глаголы',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 120.0, right: 120.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.grey,
                          ),
                          child: Text(
                            '6122',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 170, left: 310, right: 25),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.red,
                  ),
                  child: Text(
                    '6',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class NewInputCard extends StatefulWidget {
  NewCard newCardInput = NewCard();
  NewInputCard({required this.newCardInput});

  @override
  _NewInputCardState createState() => _NewInputCardState();
}

class _NewInputCardState extends State<NewInputCard> {
  late TextEditingController _firstSideController;
  late TextEditingController _secondSideController;
  var value2;

  @override
  void initState() {
    super.initState();
    _firstSideController = TextEditingController();
    _secondSideController = TextEditingController();
  }

  @override
  void dispose() {
    _firstSideController.dispose();
    _secondSideController.dispose();
    super.dispose();
  }

  void printController() {
    print(_firstSideController.text);
    print(_secondSideController.text);
  }

  // NewCard newCard = NewCard();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFormField(
            controller: _firstSideController,
            onSaved: (String? value) => print('value is: $value'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              hintText: 'Передняя сторона',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: Colors.black87,
            thickness: 1.0,
            indent: 6.0,
            endIndent: 6.0,
          ),
          TextFormField(
            controller: _secondSideController,
            onSaved: (String? value) {
              value2 = value;
              widget.newCardInput.setSecondSide(value!);
              print('value is: $value');
            },
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
            ),
            decoration: InputDecoration(
              hintText: 'Задняя сторона',
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
          TextButton(onPressed: (){print('${_secondSideController.text} value: $value2');}, child: Text('button'),),
        ],
      ),
    );
  }
}
