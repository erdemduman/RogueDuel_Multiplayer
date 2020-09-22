import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_provider.dart' as Game;

class AttackDefenceUnit extends StatelessWidget {
  final Function(Game.ActionType) onAction;
  static const double _pi = 3.14;

  AttackDefenceUnit({@required this.onAction});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => onAction(Game.ActionType.Attack),
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
              onPressed: () => onAction(Game.ActionType.Defence),
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
