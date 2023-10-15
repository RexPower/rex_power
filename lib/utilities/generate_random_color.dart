import 'dart:math';
import 'package:flutter/material.dart';

final _random = Random();

Color generateRandomColor() {
  return Color(_random.nextInt(0xFFFFFFFF));
}
