import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_widget.dart';

List<List<Widget>> introTrebleClefContent = [
  [
    InformationWindowTitle(text: 'Page One'),
    InformationWindowText(
      text: 'Hello this is some text, just testing this one out',
    )
  ],
  [
    InformationWindowTitle(text: 'Page Two'),
    InformationWindowText(
      text:
          'This should be the second page of the InformationWindow.  I can say anything I want here',
    ),
    InformationWindowText(
      text: 'Let us add a happy little picture',
    ),
    SvgPicture.asset('assets/treble_clef.svg')
  ],
  [
    InformationWindowTitle(text: 'Page Three'),
    InformationWindowText(
      text: 'We are on page three now',
    ),
    InformationWindowText(
      text: 'Maybe some boxes?',
    ),
    for (var i = 0; i < 5; i++)
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 30,
          color: Colors.orange,
        ),
      )
  ],
];
