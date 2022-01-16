import 'package:flutter/material.dart';
import 'My_wdget.dart';
import 'equipment.dart';
import 'package:get/get.dart';

import 'new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //final List<Equipment> EquipmentList;
  RxInt? test;
  RxList<Equipment> equipmentList = [
    Equipment(name: "Bonjour", numSerie: "a"),
    Equipment(name: "Aurevoir", numSerie: "b"),
    Equipment(name: "Ça va ?", numSerie: "c"),
    Equipment(name: "Tranquille et toi?", numSerie: "d"),
    Equipment(name: "Tranquille", numSerie: "e"),
  ].obs;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "home",
      getPages: [
        GetPage(name: "/new_page", page: () => const new_page()),
        GetPage(
            name: "/home", page: () => MyWidget(EquipmentList: equipmentList))
      ],
    );
  }
}
