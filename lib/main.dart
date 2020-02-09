//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:ku/Register.dart';
import 'package:ku/loading.dart';

import 'package:ku/signin.dart';
import 'package:ku/App.dart';
import 'package:ku/Routine.dart';
import 'package:ku/Profile.dart';
import 'package:ku/Settings.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/': (context) => SignIn(),
    '/App': (context) => App(),
    '/Routine': (context) => Routine(),
    '/Profile': (context) => Profile(),
    '/settings': (context) => Settings(),
    '/signin': (context) => SignIn(),
    '/register': (context) => Register(),
    '/loading': (context) => Loading()
  }
));