import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pracc/view/counter.dart';
import 'package:pracc/view/diary.dart';
import 'package:pracc/view/divider.dart';
import 'package:pracc/view/lotto.dart';
import 'package:pracc/view/schedule.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.to(() => const CounterPage());
              },
              child: const Text('카운터', style: TextStyle(fontSize: 40))),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Lotto());
              },
              child: const Text('로또', style: TextStyle(fontSize: 40))),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Ndivider());
              },
              child: const Text('엔빵', style: TextStyle(fontSize: 40))),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Schedule());
              },
              child: const Text('스케줄러', style: TextStyle(fontSize: 40))),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Get.to(() => const Diary());
              },
              child: const Text('다이어리', style: TextStyle(fontSize: 40)))
        ],
      ),
    ));
  }
}
