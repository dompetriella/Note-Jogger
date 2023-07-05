import 'package:flutter/material.dart';
import 'package:note_jogger/components/quiz/heart_container.dart';
import 'package:note_jogger/components/quiz/quiz_generate.dart';
import 'package:note_jogger/components/results/rank_card.dart';
import 'package:note_jogger/components/results/rank_result.dart';
import 'package:note_jogger/game_logic/results.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/modes.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/models/quiz_answer.dart';
import 'package:note_jogger/models/ranks.dart';
import 'package:note_jogger/utility.dart';
import '../common_widget.dart';

List<List<Widget>> introBasicsContent = [
  [
    const InformationWindowTitle(text: 'Welcome!'),
    const InformationWindowSubtitle(text: 'Idea behind Note Jogger'),
    const InformationWindowText(
      text:
          'The idea behind Note Jogger is to make learning music and music theory as much of a game as possible.',
    ),
    const InformationWindowText(
        text:
            "I like to think of it like a couch to 5k app, or training for a marathon, it's a lot of work and commitment but it pays off in a great new skill and feeling of accomplishment.  And believe it or not, it can be fun!  I hope this app will especially contribute to that last part."),
    const InformationWindowText(
        text:
            'You can use Training mode (current mode) to sharpen your skills and learn about the basics of reading/playing music.'),
    const InformationWindowText(
        text:
            'Or go for a high ranking in the Ranked mode that tests your knowledge and speed at identifying notes.'),
    const InformationWindowText(text: 'Most of all, have fun!')
  ],
  [
    const InformationWindowTitle(text: 'How to Play'),
    const InformationWindowSubtitle(text: 'Training Mode'),
    const InformationWindowText(
      text:
          'Training modes are broken into individual lessons that increase in difficulty as you go.',
    ),
    const InformationWindowText(
      text:
          'When you start a lesson or "jog", it will present you with something like this.',
    ),
    const QuizGenerate(
      note: TrebleClefNotes.C5,
      gameMode: GameMode.intro,
    ),
    InformationWindowText(
        text:
            'Click one of the buttons that corresponds to the note displayed on the staff to see if that guess is correct or not.  You will receieve roughly $GLOBAL_normal_quiz_amount questions per training but that amount may vary.'),
    const InformationWindowText(
        text:
            'In training mode, the time you take the click the button is recorded, but only for your reference at the end of the jog, and the amount of correct answers you chose will be displayed at the results page.'),
    const InformationWindowText(
        text:
            'Use training mode as a build-up towards the Ranked mode that will put your skills to the test and give you a grade for all your hard work!'),
  ],
  [
    const InformationWindowTitle(text: 'How to Play (Cont.)'),
    const InformationWindowSubtitle(text: 'Ranked Mode'),
    const InformationWindowText(
      text:
          'Unlike the leisurely pace of the training mode, Ranked mode will give you a rank based on your time between questions and rank you accordingly, looking something like this',
    ),
    Wrap(
      children: [
        for (var i = 0; i < 12; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RankCard(
                answer: QuizAnswer(
                    correct: true,
                    timeElapsed: getRandomInt(5000, min: 1200).toDouble()),
                index: i),
          )
      ],
    ),
    const InformationWindowSubtitle(text: 'Lives'),
    InformationWindowText(
      text:
          'In addition, you will have $GLOBAL_lives lives to complete the Ranked quiz or "Marathon".  They look like this, and you can find them in the top right corner',
    ),
    const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HeartContainer(
          size: 3.5,
        ),
        HeartContainer(
          size: 3.5,
        ),
        HeartContainer(
          size: 3.5,
        )
      ],
    ),
    InformationWindowText(
        text:
            'Losing lives affects your ending rank score, and losing all $GLOBAL_lives will result in a D Rank (you will be able to finish the Marathon however, never give up!)'),
    const InformationWindowSubtitle(text: 'Final Rank'),
    const InformationWindowText(
        text:
            'Your time and your lives left will give you a calculation for a final score, ranked best to worst and looks like this.'),
    Wrap(
      alignment: WrapAlignment.center,
      children: [
        for (var i = 0; i < Rank.values.length - 1; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              Rank.values[i].name,
              style: TextStyle(
                  color: getRankTextColor(Rank.values[i].name),
                  fontSize: 36,
                  fontWeight: FontWeight.w900),
            ),
          )
      ],
    ),
    const FinalRankResult(text: 'S'),
    const InformationWindowText(
      text: 'Shoot for the elusive S Rank!',
      textAlign: TextAlign.center,
    )
  ],
];
