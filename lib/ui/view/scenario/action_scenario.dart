import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class ActionScenario extends StatefulWidget {
  @override
  _ActionScenarioState createState() => _ActionScenarioState();
}

class _ActionScenarioState extends State<ActionScenario> {
  Game.Provider _provider;
  static const double _pi = 3.14;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          healthView(),
          Expanded(child: calculateView()),
          attackAndDefenceView(),
        ],
      )),
      backgroundColor: Colors.black,
    );
  }

  Container healthView() {
    return Container(
      child: Column(children: [
        Row(children: [
          Text("Player 1", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("Player 2", style: TextStyle(fontSize: 25)),
        ]),
        SizedBox(height: 10),
        Row(children: [
          Image.asset('assets/pixel_heart.png', height: 35),
          SizedBox(width: 10),
          Text("95", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("100", style: TextStyle(fontSize: 25)),
          SizedBox(width: 10),
          Image.asset('assets/pixel_heart.png', height: 35),
        ])
      ]),
    );
  }

  Container calculateView() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          Text(
            "If you roll",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 20),
          NumberPicker.horizontal(
            initialValue: _provider.currentCalculateValue,
            minValue: 0,
            maxValue: 20,
            listViewHeight: 60,
            onChanged: (number) => _provider.changeCalculateValue(number),
          ),
          SizedBox(height: 20),
          Text(
            "the impact will be",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Transform.rotate(
                    angle: _pi / 4,
                    child: Container(
                      child: Image.asset('assets/pixel_attack.png'),
                      height: 45,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text("15", style: TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  Text("16", style: TextStyle(fontSize: 25)),
                  SizedBox(width: 5),
                  Container(
                      child: Image.asset('assets/pixel_defence.png'),
                      height: 40)
                ],
              )
            ],
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  Container attackAndDefenceView() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: RaisedButton(
              onPressed: () =>
                  _provider?.goToDiceScenario(Game.ActionType.Attack),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform.rotate(
                    angle: _pi / 4,
                    child: Container(
                      child: Image.asset('assets/pixel_attack.png'),
                      height: 80,
                    ),
                  ),
                  Text("ATT", style: TextStyle(color: Colors.white))
                ],
              ),
              color: Colors.black,
            ),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: RaisedButton(
              onPressed: () =>
                  _provider?.goToDiceScenario(Game.ActionType.Defence),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.asset('assets/pixel_defence.png'),
                    height: 80,
                  ),
                  Text("DEF", style: TextStyle(color: Colors.white))
                ],
              ),
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
