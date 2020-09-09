import 'package:project_rd/model/gift.dart';

class Player {
  String name;
  int hp;
  List<Gift> giftList;
  Impact impact;
  Dice dice;
}

class Impact {
  int attack;
  int defence;
}

class Dice {
  int diceValue;
  DiceType diceType;
  int diceRemaining;
}

enum DiceType { Attack, Defence }
