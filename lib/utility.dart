import 'dart:math';

import 'package:flutter/material.dart';

String capitalizeString(String s) => s[0].toUpperCase() + s.substring(1);

int getRandomInt(int max, {int min = 0}) {
  Random random = Random();
  return random.nextInt(max) + min;
}

Color darkenColor(Color c, {int percent = 10}) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

Color lightenColor(Color color, {double percent = 10}) {
  assert(percent >= 0 && percent <= 100);

  final hsl = HSLColor.fromColor(color);
  final hslLight =
      hsl.withLightness((hsl.lightness + (percent / 100)).clamp(0.0, 1.0));

  return hslLight.toColor();
}
