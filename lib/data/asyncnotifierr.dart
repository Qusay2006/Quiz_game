import 'package:quizegame/data/quiz_question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../api/get_question.dart';
part 'asyncnotifierr.g.dart';

@riverpod
class Asyncnotifierr extends _$Asyncnotifierr {
  @override
  Future<List<QuizQuestion>> build()async {
    return loadquestion();
  }
    int currentIndex=0;
    int score = 0;
    bool isCorrect = false;
    int indexx=-1;
    bool isFinished= false;

  Future<bool> thecorrectanser(String sellectedAnswer , int qustionIndex , int index)async{
    indexx=index;
     final dataa = state.value;
       if (dataa == null)
       {
          isCorrect = false;
       }
     else if (sellectedAnswer == dataa[qustionIndex].correctAnswer[0]) {
         score++;
            isCorrect = true;
    }
     else{
       isCorrect =false;
       }
    state=state;
      await Future.delayed(const Duration(milliseconds: 510));
    if(dataa!.length-1 >currentIndex){
        currentIndex++;
    isFinished = false;
    }
    else {
     isFinished =true;
    }
         indexx=-1;
          state=state;
            return isCorrect;
  }

  int getscor ()=>score;
  bool isCorrecto()=>isCorrect;
  int index ()=>indexx;
  int currenindexx()=> currentIndex;
  bool isfinished()=>isFinished;


  void reset (){
    score =0 ;
    currentIndex = 0;
    isFinished = false;
    isCorrect=false;
  }
}

