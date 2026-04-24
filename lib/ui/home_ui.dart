import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quizegame/data/asyncnotifierr.dart';
import 'package:quizegame/pages/home_screen.dart';
import 'package:quizegame/pages/quiz_screen.dart';
import '../pages/login_page.dart';

class HomeUi extends ConsumerStatefulWidget {
  const HomeUi({super.key});

  ConsumerState<HomeUi>createState()=> _HomeUiState();
  }
  class _HomeUiState extends ConsumerState<HomeUi>{
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start
          ,children: [
            Lottie.network("https://lottie.host/ada1bd89-ee4a-459e-b098-47d7cf3c5dd0/SiivQ86hON.json",
                height: 300,width: 350,errorBuilder: (context, error, stackTrace) {
                  return const Column(
                    children: [SizedBox(height: 180,)
                      , Text("Please connect to Wifi"),
                    ],
                  );
                },),
            const SizedBox(height: 120),

            ElevatedButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return const QuizScreen();
},));

            },
              style: TextButton.styleFrom(backgroundColor: Colors.teal,),
              child: const Text('GetStarted', style: TextStyle(color: Colors.black87),),)


          ],),
      ),
    );
  }
}