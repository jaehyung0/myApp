import 'package:flutter/material.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DiaryPage();
  }
}

class DiaryPage extends StatelessWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('다이어리')),
        body: Center(
          child: Column(
            children: const [Text('g'), Text('j')],
          ),
        ));
  }
}
