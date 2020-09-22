import 'package:flutter/widgets.dart';
import 'package:project_rd/data/gift.dart';

class Player {
  String name;
  int hp;
  List<Gift> giftList = List<Gift>();
  Impact impact = Impact(attack: 0, defence: 0);
  Dice dice = Dice(diceValue: null, diceType: null, diceRemaining: 1);
  int castedConjurations = 0;

  Player(
      {@required this.name,
      @required this.hp,
      this.giftList,
      this.impact,
      this.dice});
}

class Impact {
  int attack;
  int defence;

  Impact({@required this.attack, @required this.defence});
}

class Dice {
  int diceValue;
  DiceType diceType;
  int diceRemaining;

  Dice(
      {@required this.diceValue,
      @required this.diceType,
      @required this.diceRemaining});
}

enum DiceType { Attack, Defence }
