import 'package:project_rd/logic/utils/workflow.dart';
import 'package:project_rd/model/gift.dart';
import 'package:project_rd/model/player.dart';

import 'base_use_case.dart' as Base;

class UseCase extends Base.UseCase {
  Player _me;
  Player _opponent;
  Callback _callback;

  Future<void> executeAsync(
      Base.Parameter parameter, Base.Callback callback) async {
    var param = parameter as Parameter;
    _callback = callback as Callback;
    _me = param.me;
    _opponent = param.opponent;

    await processTheGifts(
        _me,
        _me.giftList
            .where((gift) =>
                gift.effectType == EffectType.Self && gift is Invocation)
            .toList());
    await processTheGifts(
        _opponent,
        _opponent.giftList
            .where((gift) =>
                gift.effectType == EffectType.Self && gift is Invocation)
            .toList());
    await processTheGifts(
        _me,
        _me.giftList
            .where((gift) =>
                gift.effectType == EffectType.Self && gift is Conjuration)
            .toList());
    await processTheGifts(
        _opponent,
        _opponent.giftList
            .where((gift) =>
                gift.effectType == EffectType.Self && gift is Conjuration)
            .toList());

    await processTheGifts(
        _me,
        _me.giftList
            .where((gift) =>
                gift.effectType == EffectType.Opponent && gift is Invocation)
            .toList());
    await processTheGifts(
        _opponent,
        _opponent.giftList
            .where((gift) =>
                gift.effectType == EffectType.Opponent && gift is Invocation)
            .toList());
    await processTheGifts(
        _me,
        _me.giftList
            .where((gift) =>
                gift.effectType == EffectType.Opponent && gift is Conjuration)
            .toList());
    await processTheGifts(
        _opponent,
        _opponent.giftList
            .where((gift) =>
                gift.effectType == EffectType.Opponent && gift is Conjuration)
            .toList());
  }

  Future<void> processTheGifts(Player player, List<Gift> gifts) {
    gifts.forEach((gift) {
      gift.effect(player);
    });
  }
}

class Parameter extends Base.Parameter {
  Player me;
  Player opponent;
}

class Callback extends Base.Callback {
  void onDone() {}
}
