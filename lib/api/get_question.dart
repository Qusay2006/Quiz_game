import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizegame/data/quiz_question.dart';

Future<List<QuizQuestion>> loadquestion()async{

  int index = 0;
  List<QuizQuestion> newlist =[];
  //هون منقدر نحدد الصعوبة بمسح الرابط الصعوبة
  final url = Uri.parse('https://opentdb.com/api.php?amount=10&difficulty=easy&category=21');
  final result = await http.get(url);
  if(result.statusCode==200||result.statusCode==201){
    final map= jsonDecode(result.body) as Map<String , dynamic>;
    final list = map['results'];
  for (var n in list){
    newlist.add(QuizQuestion.fromJson(n, index));
    index++;
    int questionlength = newlist.length;
  }
    return newlist;
  }
  return [];
}