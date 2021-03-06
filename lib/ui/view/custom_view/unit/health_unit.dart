import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:provider/provider.dart';

class HealthUnit extends StatefulWidget {
  @override
  _HealthUnitState createState() => _HealthUnitState();
}

class _HealthUnitState extends State<HealthUnit> {
  Game.ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<Game.ViewModel>(context);
    return Container(
      child: Column(children: [
        Row(children: [
          Text("Rogue", style: TextStyle(fontSize: 25)),
          Spacer(),
          Text("Opponent", style: TextStyle(fontSize: 25)),
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
}
