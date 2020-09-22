import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_provider.dart' as Game;
import 'package:project_rd/ui/view/unit/attack_defence_unit.dart';
import 'package:project_rd/ui/view/unit/calculate_unit.dart';
import 'package:project_rd/ui/view/unit/health_unit.dart';
import 'package:provider/provider.dart';

class ActionScenario extends StatefulWidget {
  @override
  _ActionScenarioState createState() => _ActionScenarioState();
}

class _ActionScenarioState extends State<ActionScenario> {
  Game.Provider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.Provider>(context);
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: HealthUnit(), flex: 1),
          Expanded(child: CalculateUnit(), flex: 3),
          Expanded(
            child: AttackDefenceUnit(onAction: _provider.goToDiceScenario),
            flex: 2,
          ),
        ],
      )),
      backgroundColor: Colors.black,
    );
  }
}
