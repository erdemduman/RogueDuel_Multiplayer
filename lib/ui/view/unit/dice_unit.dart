import 'package:flutter/widgets.dart';
import 'package:project_rd/logic/provider/game_provider.dart' as Game;
import 'package:provider/provider.dart';

class DiceUnit extends StatefulWidget {
  @override
  _DiceUnitState createState() => _DiceUnitState();
}

class _DiceUnitState extends State<DiceUnit> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Container(
        child: Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: Image.asset('assets/dice.png'),
          ),
          Text(
            _provider?.diceNumber != null ? _provider?.diceNumber : "",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    ));
  }
}