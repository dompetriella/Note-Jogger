import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'common_widget.dart';

List<List<Widget>> introTrebleClefContent = [
  [
    const InformationWindowTitle(text: 'Page One'),
    const InformationWindowText(
      text: 'Hello this is some text, just testing this one out',
    )
  ],
  [
    const InformationWindowTitle(text: 'Page Two'),
    const InformationWindowText(
      text:
          'This should be the second page of the InformationWindow.  I can say anything I want here',
    ),
    const InformationWindowText(
      text: 'Let us add a happy little picture',
    ),
    SvgPicture.asset('assets/treble_clef.svg')
  ],
  [
    const InformationWindowTitle(text: 'Page Three'),
    const InformationWindowText(
      text: 'We are on page three now',
    ),
    const InformationWindowText(
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
  [
    const InformationWindowTitle(text: 'Page Four'),
    const InformationWindowText(
      text: 'WE PAGE FOUR NOW LET GET CRAZY',
    ),
    const InformationWindowText(
      text: 'MANY TEXTS',
    ),
    for (var i = 0; i < 5; i++)
      const InformationWindowText(text: '''SING US A SONG YOU ARE THE SPIDERMAN, 
SING US A SONG TONIGHT, 
ALL IN THE MOOD FOR A HERO NOW
AND YOU HAVE GOT US FEELING ALRIGHT''')
  ],
];
