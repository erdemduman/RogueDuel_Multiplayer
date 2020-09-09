import 'package:flutter/widgets.dart';
import 'package:project_rd/model/player.dart';

class Gift {
  int id;
  String name;
  String definition;
  EffectType effectType;
  Function(Player) effect;
  int rarity;

  Gift(
      {@required this.id,
      @required this.name,
      @required this.definition,
      @required this.effectType,
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
      @required EffectType effectType,
      @required Function(Player) effect,
      @required int rarity,
      @required this.howManyLeft})
      : super(
            id: id,
            name: name,
            definition: definition,
            effectType: effectType,
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
      @required EffectType effectType,
      @required Function(Player) effect,
      @required int rarity,
      this.message})
      : super(
            id: id,
            name: name,
            definition: definition,
            effectType: effectType,
            effect: effect,
            rarity: rarity);
}

class Status {
  int id;
  String name;
  int turnNumber;
}

enum EffectType { Self, Opponent }
