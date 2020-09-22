import 'package:flutter/widgets.dart';
import 'package:project_rd/data/player.dart';

abstract class Gift {
  int id;
  String name;
  String definition;
  EffectType effectType;
  Function(Player, Player) effect;
  int rarity;

  num get remaining;
  bool get active;
  String get message;

  Gift(
      {@required this.id,
      @required this.name,
      @required this.definition,
      @required this.effectType,
      @required this.effect,
      @required this.rarity});
}

class Invocation extends Gift {
  num remainingProp;

  Invocation(
      {@required int id,
      @required String name,
      @required String definition,
      @required EffectType effectType,
      @required Function(Player, Player) effect,
      @required int rarity,
      @required this.remainingProp})
      : super(
            id: id,
            name: name,
            definition: definition,
            effectType: effectType,
            effect: effect,
            rarity: rarity);

  @override
  num get remaining => remaining;

  @override
  bool get active => throw UnimplementedError();

  @override
  String get message => throw UnimplementedError();
}

class Conjuration extends Gift {
  bool activeProp = false;
  String messageProp;

  Conjuration(
      {@required int id,
      @required String name,
      @required String definition,
      @required EffectType effectType,
      @required Function(Player, Player) effect,
      @required int rarity,
      this.messageProp})
      : super(
            id: id,
            name: name,
            definition: definition,
            effectType: effectType,
            effect: effect,
            rarity: rarity);

  @override
  num get remaining => throw UnimplementedError();

  @override
  bool get active => activeProp;

  @override
  String get message => messageProp;
}

class Status {
  int id;
  String name;
  int turnNumber;
}

enum EffectType { Self, Opponent }
