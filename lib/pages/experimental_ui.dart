import 'package:flutter/material.dart';
import 'package:note_jogger/components/generic_button.dart';
import 'package:note_jogger/components/notestaff/note_staff.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/pages/start_page.dart';

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return InformationWindow();
  }
}

class InformationWindow extends StatelessWidget {
  const InformationWindow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.background,
              child: InformationWindowContents(),
            ),
          ),
          InformationWindowStaging()
        ],
      ),
    );
  }
}

class InformationWindowStaging extends StatelessWidget {
  const InformationWindowStaging({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      color: Theme.of(context).colorScheme.primary.withOpacity(.1),
      child: Center(
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * .5,
          child: Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var i = 0; i < 5; i++)
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Center(
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}

class InformationWindowContents extends StatelessWidget {
  const InformationWindowContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: ListView(
        children: [
          InformationWidgetTitle(),
          for (var i = 0; i < 5; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque gravida venenatis.' +
                    'In et sollicitudin diam. Fusce commodo eleifend tristique.',
                textAlign: TextAlign.center,
              ),
            ),
          Center(child: NoteStaff(value: TrebleClefNotes.C1, imagePath: '')),
          for (var i = 0; i < 9; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque gravida venenatis.' +
                    'In et sollicitudin diam. Fusce commodo eleifend tristique.',
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}

class InformationWidgetTitle extends StatelessWidget {
  const InformationWidgetTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        'Information Window',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
