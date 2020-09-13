import 'dart:math';

import 'package:project_rd/model/gift.dart';
import 'package:project_rd/model/player.dart';

import 'base_use_case.dart' as Base;

class UseCase extends Base.UseCase {
  Player _me;
  Player _opponent;
  Callback _callback;
  bool _isCalculate;

  Future<void> executeAsync(
      Base.Parameter parameter, Base.Callback callback) async {
    var param = parameter as Parameter;
    _callback = callback as Callback;
    _me = param.me;
    _opponent = param.opponent;
    _isCalculate = param.isCalculate;

    if (!_isCalculate) {
      var bothGifts = await initBothGifts();
      await processBothGifts(bothGifts);
      await removeUnnecessary();
    } else {
      var gifts = await initGifts();
      await processGifts(gifts);
    }
  }

  Future<List<List<Gift>>> initBothGifts() {
    List<Gift> meList = [];
    List<Gift> opponentList = [];

    _me.giftList.forEach((gift) {
      if (gift is Conjuration) {
        if (gift.active) meList.add(gift);
      } else {
        if (gift.remaining > 0) meList.add(gift);
      }
    });

    _opponent.giftList.forEach((gift) {
      if (gift is Conjuration) {
        if (gift.active) opponentList.add(gift);
      } else {
        if (gift.remaining > 0) opponentList.add(gift);
      }
    });
    return Future.value([meList, opponentList]);
  }

  Future<void> processBothGifts(List<List<Gift>> bothGifts) {
    int index;
    var meGifts = bothGifts[0];
    var opponentGifts = bothGifts[1];
    var meGiftSize = meGifts.length;
    var opponentGiftSize = opponentGifts.length;
    var minGiftSize = min(meGiftSize, opponentGiftSize);

    for (index = 0; index < minGiftSize; index++) {
      if (meGifts[index].effectType == EffectType.Opponent) {
        opponentGifts[index].effect(_me, _opponent);
        meGifts[index].effect(_me, _opponent);
      } else {
        meGifts[index].effect(_me, _opponent);
        opponentGifts[index].effect(_me, _opponent);
      }
    }

    var restOfGifts = meGiftSize > opponentGiftSize ? meGifts : opponentGifts;
    var total = (meGiftSize - opponentGiftSize).abs() + minGiftSize;

    for (int i = index; i < total; i++) {
      restOfGifts[i].effect(_me, _opponent);
    }
  }

  Future<List<Gift>> initGifts() {
    List<Gift> meList = [];
    _me.giftList.forEach((gift) {
      if (gift is Conjuration) {
        if (gift.active) meList.add(gift);
      } else {
        if (gift.remaining > 0) meList.add(gift);
      }
    });
    return Future.value(meList);
  }

  Future<void> processGifts(List<Gift> gifts) {
    gifts.forEach((gift) {
      gift.effect(_me, _opponent);
    });
  }

  Future<void> removeUnnecessary() {
    var newMeList = [];
    var newOpponentList = [];

    for (int i = 0; i < _me.giftList.length; i++) {
      if (!(_me.giftList[i] is Conjuration && _me.giftList[i].active))
        newMeList.add(i);
    }
    _me.giftList = newMeList;

    for (int i = 0; i < _opponent.giftList.length; i++) {
      if (!(_opponent.giftList[i] is Conjuration &&
          _opponent.giftList[i].active)) newOpponentList.add(i);
    }
    _opponent.giftList = newOpponentList;
  }
}

class Parameter extends Base.Parameter {
  Player me;
  Player opponent;
  String diceString;
  DiceType diceType;
  bool isCalculate;
}

class Callback extends Base.Callback {
  void onDone() {}
}
