import 'package:flutter/material.dart';
import 'package:note_jogger/models/notes.dart';

import 'components/notestaff/full_staff.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Jogger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(.1),
            foregroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: Text(
              "Note Jogger",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2),
            )),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Center(
            child: GestureDetector(
              onTap: () => print('hello'),
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.lightbulb,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: 40,
                  )),
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HeartContainer(),
                    HeartContainer(),
                    HeartContainer()
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NoteStaff(
                      value: TrebleClefNotes.C2.index,
                    ),
                    SizedBox(
                      width: 300,
                      child: Wrap(
                        runAlignment: WrapAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    onPressed: () => print('hello'),
                                    child: Text('Hello'))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartContainer extends StatelessWidget {
  const HeartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 3),
            color: Theme.of(context).colorScheme.secondary.withOpacity(.25)),
      ),
    );
  }
}
