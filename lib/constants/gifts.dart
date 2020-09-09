import 'package:project_rd/model/gift.dart';
import 'package:project_rd/model/player.dart';

List<Gift> gifts = [
  Invocation(
      id: 1,
      name: "Sword of Fellows",
      definition: "Hit more than 10% of the rolled dice.",
      effect: (me, _) => me.impact.attack +=
          (me.dice.diceValue / 10).round() + me.dice.diceValue,
      rarity: 5,
      priority: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 2,
      name: "Rogue's Heart",
      definition: "Increase your max HP by 10.",
      effect: (me, _) => me.hp += 10,
      rarity: 3,
      priority: 1,
      howManyLeft: 1),
  Invocation(
      id: 3,
      name: "Rogue's Heart+",
      definition: "Increase your max HP by 20.",
      effect: (me, _) => me.hp += 20,
      rarity: 2,
      priority: 1,
      howManyLeft: 1),
  Invocation(
      id: 4,
      name: "Rogue's Heart++",
      definition: "Increase your max HP by 30.",
      effect: (me, _) => me.hp += 30,
      rarity: 1,
      priority: 1,
      howManyLeft: 1),
  Invocation(
      id: 5,
      name: "All In",
      definition: "Double your attack dice, halve your defence dice.",
      effect: (me, _) {
        if (me.dice.diceType == DiceType.Attack) {
          me.dice.diceValue *= 2;
        } else if (me.dice.diceType == DiceType.Defence) {
          me.dice.diceValue = (me.dice.diceValue / 2).round();
        }
      },
      rarity: 5,
      priority: 1,
      howManyLeft: double.infinity),
  Invocation(
      id: 6,
      name: "Thick as a Brick",
      definition: "Defend more than 10% of the rolled dice.",
      effect: (me, _) => me.impact.defence +=
          (me.dice.diceValue / 10).round() + me.dice.diceValue,
      rarity: 5,
      priority: 3,
      howManyLeft: double.infinity),
  Conjuration(
      id: 7,
      name: "Master Gambler",
      definition: "Gain one more rolling chance.",
      effect: (me, _) => me.dice.diceRemaining += 1,
      rarity: 5),
  Invocation(
      id: 8,
      name: "Sword of Fellows+",
      definition: "Hit more than 25% of the rolled dice.",
      effect: (me, _) => me.impact.attack +=
          (me.dice.diceValue / 4).round() + me.dice.diceValue,
      rarity: 3,
      priority: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 9,
      name: "Thick as a Brick+",
      definition: "Defend more than 25% of the rolled dice.",
      effect: (me, _) => me.impact.defence +=
          (me.dice.diceValue / 4).round() + me.dice.diceValue,
      rarity: 3,
      priority: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 10,
      name: "Guaranteed Hands",
      definition: "If the rolled dice is less than 5, equalize it to 5.",
      effect: (me, _) {
        if (me.dice.diceValue < 5) me.dice.diceValue = 5;
      },
      rarity: 1,
      priority: 2,
      howManyLeft: double.infinity),
  Conjuration(
    id: 11,
    name: "Falsifier",
    definition: "Dodge the enemy attack next turn.",
    effect: (me, _) {/*TODO implement here*/},
    rarity: 3,
  ),
  Conjuration(
    id: 12,
    name: "Zero Tolerance",
    definition: "Ignore the enemy defence next turn.",
    effect: (me, _) {/*TODO implement here*/},
    rarity: 3,
  ),
  Invocation(
      id: 13,
      name: "A Better Life",
      definition:
          "Apply regeneration for 3 turns.\n\nRegeneration: Heals your HP with N. --> N = Number of the remaining turns for this gift.",
      effect: (me, _) {/*TODO implement here*/},
      rarity: 2,
      priority: 2,
      howManyLeft: 3),
  Invocation(
      id: 14,
      name: "Blacksmith's Dream",
      definition:
          "Never get your sword broken again.\n\nBroken Sword: Your sword is broken if your attack is less than opponent's defence. As the effect, your damage is reduced by half for one turn.",
      effect: (me, _) {/*TODO implement here*/},
      rarity: 1,
      priority: 2,
      howManyLeft: double.infinity),
];
