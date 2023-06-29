import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';
import 'package:note_jogger/routes.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Note Jogger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          fontFamily: 'LondrinaSolid',
          useMaterial3: true,
          sliderTheme: SliderTheme.of(context).copyWith(
            trackHeight: 32,
            thumbShape:
                RoundSliderThumbShape(enabledThumbRadius: 17.0, elevation: 0),
          )),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: Colors.blue),
        fontFamily: 'LondrinaSolid',
        useMaterial3: true,
      ),
      themeMode: ref.watch(lightModeProvider),
      routerConfig: router,
    );
  }
}
