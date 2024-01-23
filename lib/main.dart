import 'package:finger_tap_battle/fisrt_page.dart';
import 'package:finger_tap_battle/second_page.dart';
import 'package:finger_tap_battle/third_page.dart';
import 'package:finger_tap_battle/userlist.dart';
import 'package:flutter/material.dart';

import 'game_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserList(),
    );
  }
}
