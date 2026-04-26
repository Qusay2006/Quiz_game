import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:quizegame/data/asyncnotifierr.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quizegame/pages/home_screen.dart';
import '../data/textstyling.dart';

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({super.key});
  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
  }

class _QuizScreenState extends ConsumerState<QuizScreen> {



    @override
    Widget build(BuildContext context) {
      final question = ref.watch(asyncnotifierrProvider);
      final notifier = ref.watch(asyncnotifierrProvider.notifier);

      final score= notifier.getscor();
      final isCorrecto= notifier.isCorrecto();
      final incdex= notifier.index();
      final currentindex =notifier.currenindexx();
      final isFinished = notifier.isfinished();

      int questionnumber= currentindex+1;
      Textstyling textstyling = Textstyling();


      if (isFinished == true) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          showDialog(context: context, builder: (context) {
            return AlertDialog(
              title: const Text("Quiz is Finished!!"),
              content: Text(
                'your score is $score/10', style: textstyling.question(),),
              actions: [
                ElevatedButton(onPressed: () {
                  ref.read(asyncnotifierrProvider.notifier).reset();
                  ref.invalidate(asyncnotifierrProvider);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  },));
                }, child: const Icon(Icons.door_back_door_outlined))
              ],);
          },);
        },);
      }


      return Scaffold(backgroundColor: Colors.indigo,
        body: Stack(clipBehavior: Clip.antiAlias,children: [
          const Positioned(right: -70, top: -70,
            child: CircleAvatar(
              backgroundColor: Colors.blue, maxRadius: 90,)),
           const Positioned(bottom: -70, left: -70,
              child: CircleAvatar(
                backgroundColor: Colors.blue, maxRadius: 90,)),

          Padding(
            padding: const EdgeInsets.all(24.0),
           child: Column(children: [
              Lottie.network(
                  'https://lottie.host/c8e32f18-f87b-473b-90f0-8a2ecb887dd5/kYJQriJVuD.json',
                  height: 250, width: 250,errorBuilder: (context, error, stackTrace) {
                    return const SizedBox();
                  },),

              const SizedBox(height: 20,),

              Expanded(
                child: question.when(data: (data) {
                  if (data.isEmpty){
                    return const CircularProgressIndicator();
                  }
                  else{
                String q = data[currentindex].question;
                final questionUnScape = HtmlUnescape().convert(q);
                String correct = data[currentindex].correctAnswer[0];
                List<String> wrong = data[currentindex].answers;
                return SingleChildScrollView(
                  child: Column( children: [
                  Row( children: [
                  Text('$questionnumber/10',style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black87),
                      ),
                  ],),
                
                  SizedBox(width: double.infinity,
                  child: Card(color: Colors.white10,
                  child: Text(questionUnScape,style: Textstyling().question())
                  ),),
                
                  const SizedBox(height: 30),
                
                  ...wrong.asMap().entries.map((e) {
                   return  Padding(padding: const EdgeInsets.only(top: 4),
                   child: TextButton(onPressed: incdex!=-1? null :(){
                    ref.read(asyncnotifierrProvider.notifier).thecorrectanser(e.value, currentindex,e.key);
                    },
                             child: Text(e.value),
                    style: TextButton.styleFrom(backgroundColor: incdex !=-1?(incdex ==e.key ? (isCorrecto?Colors.green:Colors.red):(e.value==correct?Colors.green:Colors.black54)):Colors.black54,
                    textStyle: textstyling.question()
                    )),
                               );
                   },),],),);
                  }
                },
                  error: (error, stackTrace) {
                  return const Column(
                    children: [SizedBox(height: 200,)
                
                      , Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.wifi_off),SizedBox(width: 4,),
                          Text('Please connect to WIFI'),
                        ],),],);
                }, loading: () {
                            return const Center(child: CircularProgressIndicator(),);
                },),
              ),
             ],),),
        ]),
      );
      }
  }


