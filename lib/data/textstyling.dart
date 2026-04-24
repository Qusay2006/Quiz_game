import 'package:flutter/material.dart';

class Textstyling {
  TextStyle question() {
    const TextStyle question = TextStyle(fontSize: 25,
        fontFamily: 'Robot',
        fontWeight:FontWeight.w200,
      color:Colors.white70
    );

    return question;
  }
  ButtonStyle textButton (){
    const ButtonStyle anserbutton = ButtonStyle(
       backgroundColor: WidgetStatePropertyAll(Colors.white,),
      iconSize: WidgetStatePropertyAll(20),
      textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 27,
      fontWeight: FontWeight.w400)),
      foregroundColor: WidgetStatePropertyAll(Colors.black)

     );
    return anserbutton;
  }
}