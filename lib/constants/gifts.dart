import 'package:project_rd/model/gift.dart';
import 'package:project_rd/model/player.dart';

List<Gift> gifts = [
  Invocation(
      id: 1,
      name: "Sword of Fellows",
      definition: "Increase your attack with 10%.",
      effectType: EffectType.Self,
      effect: (player) => player.impact.attack +=
          (player.dice.diceValue / 10).round() + player.dice.diceValue,
      rarity: 5,
      howManyLeft: double.infinity),
  Invocation(
      id: 2,
      name: "Rogue's Heart",
      definition: "Increase your max HP by 10.",
      effectType: EffectType.Self,
      effect: (player) => player.hp += 10,
      rarity: 3,
      howManyLeft: 1),
  Invocation(
      id: 3,
      name: "Rogue's Heart+",
      definition: "Increase your max HP by 20.",
      effectType: EffectType.Self,
      effect: (player) => player.hp += 20,
      rarity: 2,
      howManyLeft: 1),
  Invocation(
      id: 4,
      name: "Rogue's Heart++",
      definition: "Increase your max HP by 30.",
      effectType: EffectType.Self,
      effect: (player) => player.hp += 30,
      rarity: 1,
      howManyLeft: 1),
  Invocation(
      id: 5,
      name: "All In",
      definition: "Double your attack, halve your defence.",
      effectType: EffectType.Self,
      effect: (player) {
        if (player.dice.diceType == DiceType.Attack) {
          player.dice.diceValue *= 2;
        } else if (player.dice.diceType == DiceType.Defence) {
          player.dice.diceValue = (player.dice.diceValue / 2).round();
        }
      },
      rarity: 5,
      howManyLeft: double.infinity),
  Invocation(
      id: 6,
      name: "Thick as a Brick",
      definition: "Increase your defence with 10%.",
      effectType: EffectType.Self,
      effect: (player) => player.impact.defence +=
          (player.dice.diceValue / 10).round() + player.dice.diceValue,
      rarity: 5,
      howManyLeft: double.infinity),
  Conjuration(
      id: 7,
      name: "Master Gambler",
      definition: "Gain one more rolling chance.",
      effectType: EffectType.Self,
      effect: (player) => player.dice.diceRemaining += 1,
      rarity: 5),
  Invocation(
      id: 8,
      name: "Sword of Fellows+",
      definition: "Increase your attack with 25%.",
      effectType: EffectType.Self,
      effect: (player) => player.impact.attack +=
          (player.dice.diceValue / 4).round() + player.dice.diceValue,
      rarity: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 9,
      name: "Thick as a Brick+",
      definition: "Increase your defence with 25%.",
      effectType: EffectType.Self,
      effect: (player) => player.impact.defence +=
          (player.dice.diceValue / 4).round() + player.dice.diceValue,
      rarity: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 10,
      name: "Guaranteed Hands",
      definition: "If the rolled dice is less than 5, equalize it to 5.",
      effectType: EffectType.Self,
      effect: (player) {
        if (player.dice.diceValue < 5) player.dice.diceValue = 5;
      },
      rarity: 3,
      howManyLeft: double.infinity),
  Conjuration(
    id: 11,
    name: "Falsifier",
    definition: "Dodge the enemy attack next turn.",
    effectType: EffectType.Opponent,
    effect: (player) {/*TODO implement here*/},
    rarity: 3,
  ),
  Conjuration(
    id: 12,
    name: "Zero Tolerance",
    definition: "Ignore the enemy defence next turn.",
    effectType: EffectType.Opponent,
    effect: (player) {/*TODO implement here*/},
    rarity: 3,
  ),
  Invocation(
      id: 13,
      name: "A Better Life",
      definition:
          "Apply regeneration for 5 turns.\n\nRegeneration: Heals your HP with N. --> N = Number of the remaining turns for this gift.",
      effectType: EffectType.Self,
      effect: (player) {/*TODO implement here*/},
      rarity: 2,
      howManyLeft: 5),
  Invocation(
      id: 14,
      name: "Blacksmith's Dream",
      definition:
          "Never get your sword broken again.\n\nBroken Sword: Your sword is broken if your attack is less than opponent's defence. As the effect, your damage is reduced by half for one turn.",
      effectType: EffectType.Self,
      effect: (player) {/*TODO implement here*/},
      rarity: 1,
      howManyLeft: double.infinity),
  Conjuration(
    id: 15,
    name: "Forge",
    definition:
        "Avoid breaking your sword next turn.\n\nBroken Sword: Your sword is broken if your attack is less than opponent's defence. As the effect, your damage is reduced by half for one turn.",
    effectType: EffectType.Opponent,
    effect: (player) {/*TODO implement here*/},
    rarity: 5,
  ),
  Invocation(
      id: 16,
      name: "Warrior Instinct",
      definition: "Increase your attack by 1.",
      effectType: EffectType.Self,
      effect: (player) {/*TODO implement here*/},
      rarity: 3,
      howManyLeft: double.infinity),
  Invocation(
      id: 17,
      name: "Steel Body",
      definition: "Increase your defence by 1.",
      effectType: EffectType.Self,
      effect: (player) {/*TODO implement here*/},
      rarity: 3,
      howManyLeft: double.infinity),
];
