import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:provider/provider.dart';

class DiceUnit extends StatefulWidget {
  @override
  _DiceUnitState createState() => _DiceUnitState();
}

class _DiceUnitState extends State<DiceUnit> {
  Game.ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<Game.ViewModel>(context);
    return Container(
        child: Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: Image.asset('assets/dice.png'),
          ),
          Text(
            _viewModel?.diceString != null ? _viewModel?.diceString : "",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    ));
  }
}
