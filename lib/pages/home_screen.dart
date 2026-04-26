import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizegame/data/reverpd.dart';
import '../ui/home_ui.dart';
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(reverpdProvider.notifier).themeload();
    },);
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(reverpdProvider);
    return Scaffold(appBar: AppBar(
      backgroundColor: Colors.teal,
      title: const Text('Home'), centerTitle: true,
    ), drawer: Drawer(width: 220,
        child: Padding(
          padding: const EdgeInsetsGeometry.only(top: 49),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(child: IconButton(onPressed: () {
                ref.read(reverpdProvider.notifier).themedata();
               ref.read(reverpdProvider.notifier).themesaved(currentTheme==ThemeMode.light);

              }, icon: const Icon(Icons.dark_mode))),

          ]),
        )),
        body: const HomeUi()
    );
  }
}


