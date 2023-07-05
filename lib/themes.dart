import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

var redJoggers = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: HexColor('#FDF1E1'),
      onPrimary: HexColor('#251605'),
      secondary: HexColor('#E59D77'),
      onSecondary: HexColor('#251605'),
      tertiary: HexColor('#EC4067'),
      onTertiary: Colors.white,
      error: HexColor('#922D50'),
      onError: Colors.white,
      background: HexColor('#FDF1E1'),
      onBackground: Colors.black,
      surface: HexColor('#E59D77'),
      onSurface: HexColor('#251605'),
    ),
    fontFamily: 'LondrinaSolid',
    appBarTheme: AppBarTheme(
        backgroundColor: HexColor('#E59D77'),
        toolbarHeight: 50,
        shape:
            Border(bottom: BorderSide(color: HexColor('#251605'), width: 4))),
    sliderTheme: SliderThemeData(
      inactiveTrackColor: HexColor('#251605'),
      trackHeight: 32,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 17.0, elevation: 0),
    ));

var darkMode = ThemeData();
