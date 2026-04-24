import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'reverpd.g.dart';

@riverpod
class Reverpd extends _$Reverpd{
  @override
 ThemeMode build(){
return ThemeMode.light;
 }

 void themedata()  {
 final result = state == ThemeMode.dark? ThemeMode.light : ThemeMode.dark;
 state =result;
  }
  void themesaved (bool theme)async{
   final pref = await SharedPreferences.getInstance();
   pref.setBool('iconshared', theme);
  }
  void themeload ()async{
   final prefs = await SharedPreferences.getInstance();
   final result = prefs.getBool('iconshared');
   state= result ==true ?ThemeMode.dark: ThemeMode.light;

  }

}