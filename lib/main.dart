//import 'dart:js';

import 'package:flutter/material.dart';

import 'package:ku/App.dart';
import 'package:ku/Routine.dart';
import 'package:ku/Profile.dart';
import 'package:ku/Settings.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => App(),
    '/Routine': (context) => Routine(),
    '/Profile': (context) => Profile(),
    '/settings': (context) => Settings(),
  }
));