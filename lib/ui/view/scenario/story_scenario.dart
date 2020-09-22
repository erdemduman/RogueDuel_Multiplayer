import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_rd/ui/viewmodel/game_viewmodel.dart' as Game;
import 'package:provider/provider.dart';

class StoryScenario extends StatefulWidget {
  @override
  _StoryScenarioState createState() => _StoryScenarioState();
}

class _StoryScenarioState extends State<StoryScenario> {
  Game.ViewModel _provider;
  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<Game.ViewModel>(context);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: healthView(), flex: 13),
            Expanded(child: storyView(), flex: 50),
            Expanded(child: chooseGiftView(), flex: 13)
          ],
        ),
      ),
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

  Container storyView() {
    return Container(
      child: DefaultTextStyle(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Player 1 played this thing", textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text("Player 2 played this thing", textAlign: TextAlign.center),
            SizedBox(height: 10),
            Text(
              "This this this this this and this thing happened here hahahaha",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "You will probably die in the next turn hahahaha you loser",
              textAlign: TextAlign.center,
            )
          ]),
          style: TextStyle(fontSize: 18, fontFamily: 'Minecraft')),
    );
  }

  Container chooseGiftView() {
    return Container(
        child: Column(children: [
      RaisedButton(
          onPressed: _provider.goToGiftPage,
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(color: Colors.white)),
          child: Text("Choose Your Gift",
              style: TextStyle(fontFamily: 'Minecraft', color: Colors.white)))
    ]));
  }
}
