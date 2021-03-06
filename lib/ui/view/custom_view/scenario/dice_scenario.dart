import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:project_rd/ui/view/custom_view/unit/dice_unit.dart';
import 'package:project_rd/ui/view/custom_view/unit/health_unit.dart';
import 'package:project_rd/ui/view/custom_view/unit/roll_back_button_unit.dart';
import 'package:provider/provider.dart';

class DiceScenario extends StatefulWidget {
  @override
  _DiceScenarioState createState() => _DiceScenarioState();
}

class _DiceScenarioState extends State<DiceScenario> {
  Game.ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<Game.ViewModel>(context);
    return Container(
      child: Column(
        children: [
          Expanded(child: HealthUnit(), flex: 12),
          Expanded(child: DiceUnit(), flex: 25),
          Expanded(child: RollBackButtonUnit(), flex: 20)
        ],
      ),
    );
  }
}
