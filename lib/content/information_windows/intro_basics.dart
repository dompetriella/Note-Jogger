import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common_widget.dart';

List<List<Widget>> introBasicsContent = [
  [
    const InformationWindowTitle(text: 'Welcome!'),
    const InformationWindowSubtitle(text: 'Idea behind Note Jogger'),
    const InformationWindowText(
      text:
          '''The idea behind Note Jogger is make learning music and music theory a bit of a game.
          
          ''',
    ),
  ],
  [
    const InformationWindowTitle(text: 'Page Two'),
    const InformationWindowSubtitle(text: 'Learning!'),
    const InformationWindowText(
      text:
          'This should be the second page of the InformationWindow.  I can say anything I want here',
    ),
    const InformationWindowText(
      text: 'Let us add a happy little picture',
    ),
    SvgPicture.asset('assets/treble_clef.svg')
  ],
];
