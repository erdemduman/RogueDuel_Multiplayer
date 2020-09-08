import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class CalculateUnit extends StatefulWidget {
  @override
  _CalculateUnitState createState() => _CalculateUnitState();
}

class _CalculateUnitState extends State<CalculateUnit> {
  static const double _pi = 3.14;
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "If you roll",
                style: TextStyle(fontSize: 25),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: NumberPicker.horizontal(
                initialValue: _provider.currentCalculateValue,
                minValue: 0,
                maxValue: 20,
                onChanged: (number) => _provider.changeCalculateValue(number),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "the impact will be",
                style: TextStyle(fontSize: 25),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              child: Row(
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
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
