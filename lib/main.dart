import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizegame/data/reverpd.dart';
import 'package:quizegame/pages/home_screen.dart';
void main() {
  runApp(const ProviderScope(child:MyApp() ));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final _thememode= ref.watch(reverpdProvider);

      return  MaterialApp(
        themeMode: _thememode,
           theme: ThemeData.light(),
               darkTheme: ThemeData.dark(),
                  debugShowCheckedModeBanner: false,
                     home: HomeScreen(),
    );

  }
}
