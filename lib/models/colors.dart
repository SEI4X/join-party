import 'package:flutter/material.dart';

Map<int, Color> myShadows = {
  1: Color(0xee649bb3),
  2: Color(0xeec77e3e),
  3: Color(0xeebf4d7c),
  4: Color(0xee9a4ead),
  5: Color(0xee38a894),
  6: Color(0xee737373)
};

Map<int, Color> myColors = {
  1: Color(0xff50bce2),
  2: Color(0xfff6953a),
  3: Color(0xffea4579),
  4: Color(0xffd055ef),
  5: Color(0xff00cea6),
};

Map<int, LinearGradient> myGradient = {
  1: LinearGradient(
    colors: [Color(0xcc83e2f7), Color(0xcc50bce2)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  2: LinearGradient(
    colors: [Color(0xeeffac5e), Color(0xeef6953a)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  3: LinearGradient(
    colors: [Color(0xeeff88bd), Color(0xeeea4579)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  4: LinearGradient(
    colors: [Color(0xeee795fa), Color(0xeed055ef)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  5: LinearGradient(
    colors: [Color(0xee5af0c9), Color(0xee00cea6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
  6: LinearGradient(
    colors: [Color(0xeeadadad), Color(0xee999999)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  ),
};
