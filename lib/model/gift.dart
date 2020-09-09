import 'package:flutter/widgets.dart';
import 'package:project_rd/model/player.dart';

class Gift {
  int id;
  String name;
  String definition;
  Function(Player, Player) effect;
  int rarity;

  Gift(
      {@required this.id,
      @required this.name,
      @required this.definition,
      @required this.effect,
      @required this.rarity});
}

class Invocation extends Gift {
  num priority;
  num howManyLeft;

  Invocation(
      {@required int id,
      @required String name,
      @required String definition,
      @required Function(Player, Player) effect,
      @required int rarity,
      @required this.priority,
      @required this.howManyLeft})
      : super(
            id: id,
            name: name,
            definition: definition,
            effect: effect,
            rarity: rarity);
}

class Conjuration extends Gift {
  bool active = false;
  String message;

  Conjuration(
      {@required int id,
      @required String name,
      @required String definition,
      @required Function(Player, Player) effect,
      @required int rarity,
      this.message})
      : super(
            id: id,
            name: name,
            definition: definition,
            effect: effect,
            rarity: rarity);
}

class Status {
  int id;
  String name;
  int turnNumber;
}
