//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ku/Home.dart';
import 'package:ku/Recent.dart';
import 'package:ku/Routine.dart';
import 'package:ku/Settings.dart';

void main() => runApp(MaterialApp(
  //initialRoute: '/home',
  routes: {
    '/home': (context) => home(),
    '/recent': (context) => Recent(),
    '/routine': (context) => Routine(),
    '/settings': (context) => Settings(),
  },
));

