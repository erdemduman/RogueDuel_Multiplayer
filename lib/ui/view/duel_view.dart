import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/view/scenario/action_scenario.dart';
import 'package:project_rd/ui/view/scenario/dice_scenario.dart';
import 'package:project_rd/ui/view/scenario/story_scenario.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:provider/provider.dart';

class DuelView extends StatefulWidget {
  final PageController _pageController;

  DuelView(this._pageController);

  @override
  _DuelViewState createState() => _DuelViewState();
}

class _DuelViewState extends State<DuelView> {
  Game.ViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<Game.ViewModel>(context);
    return Container(
        child: Column(
          children: [
            Expanded(child: getScenario(_viewModel?.scenario), flex: 15),
            Expanded(child: downArrow(), flex: 1)
          ],
        ),
        margin: EdgeInsets.fromLTRB(15, 40, 15, 15));
  }

  Widget getScenario(Game.Scenario scenario) {
    switch (scenario) {
      case Game.Scenario.Action:
        return ActionScenario();
        break;
      case Game.Scenario.Story:
        return StoryScenario();
        break;
      case Game.Scenario.Dice:
        return DiceScenario();
        break;
      default:
    }
  }

  Container downArrow() {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
          onPressed: () {
            _viewModel?.pageViewChanged(_viewModel.pageNumber + 1);
            widget._pageController.animateToPage(_viewModel?.pageNumber,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut);
          },
          color: Colors.black,
          child: Stack(children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/down_arrow.png')),
            Align(
                alignment: Alignment.topCenter,
                child: Text("Gifts", style: TextStyle(color: Colors.grey[300])))
          ])),
    );
  }
}
