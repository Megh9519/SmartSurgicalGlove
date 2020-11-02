import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';

enum Level { Hard, Medium, Easy }                                               // Game level selection //

List<String> fillSourceArray() {                                                // listing assets //
  return [
    'assets/memorygame/ambulance.png',
    'assets/memorygame/ambulance.png',
    'assets/memorygame/gloves.png',
    'assets/memorygame/gloves.png',
    'assets/memorygame/firstaid.png',
    'assets/memorygame/firstaid.png',
    'assets/memorygame/mask.png',
    'assets/memorygame/mask.png',
    'assets/memorygame/hospital.png',
    'assets/memorygame/hospital.png',
    'assets/memorygame/nurse.png',
    'assets/memorygame/nurse.png',
    'assets/memorygame/scalpel.png',
    'assets/memorygame/scalpel.png',
    'assets/memorygame/scissors.png',
    'assets/memorygame/scissors.png',
    'assets/memorygame/stethoscope.png',
    'assets/memorygame/stethoscope.png',
    'assets/memorygame/surgery.png',
    'assets/memorygame/surgery.png',
    'assets/memorygame/surgeon.png',
    'assets/memorygame/surgeon.png',
  ];
}

List getSourceArray(                                                            // Setting difficulty level callings list of array from above //
    Level level,
    ) {
  List<String> levelAndKindList = new List<String>();
  List sourceArray = fillSourceArray();
  if (level == Level.Hard) {
    sourceArray.forEach((element) {
      levelAndKindList.add(element);
    });
  } else if (level == Level.Medium) {
    for (int i = 0; i < 16; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      levelAndKindList.add(sourceArray[i]);
    }
  }

  levelAndKindList.shuffle();
  return levelAndKindList;
}

List<bool> getInitialItemState(Level level) {
  List<bool> initialItemState = new List<bool>();
  if (level == Level.Hard) {
    for (int i = 0; i < 22; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 16; i++) {
      initialItemState.add(true);
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      initialItemState.add(true);
    }
  }
  return initialItemState;
}

List<GlobalKey<FlipCardState>> getCardStateKeys(Level level) {
  List<GlobalKey<FlipCardState>> cardStateKeys =
  new List<GlobalKey<FlipCardState>>();
  if (level == Level.Hard) {
    for (int i = 0; i < 22; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Medium) {
    for (int i = 0; i < 16; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  } else if (level == Level.Easy) {
    for (int i = 0; i < 8; i++) {
      cardStateKeys.add(GlobalKey<FlipCardState>());
    }
  }
  return cardStateKeys;
}
