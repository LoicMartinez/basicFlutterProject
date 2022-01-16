import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'equipment.dart';

class MyWidget extends StatefulWidget {
  List<Equipment> EquipmentList;
  MyWidget({Key? key, required this.EquipmentList}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidget();
}

class _MyWidget extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    var EquipmentList = widget.EquipmentList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Porjet flutter !!'),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Center(
            child: Column(
              children: [
                StockDescription(
                  equipmentNumber: EquipmentList.length,
                ),
                InkWell(
                  onTap: () => Get.toNamed("new_page"),
                  child: Text("bojour"),
                ),
                Column(
                  children: List.generate(
                    EquipmentList.length,
                    (index) => StockWidget(
                      equipmentName: EquipmentList[index].name ?? "Vide",
                      equipmentNumSerie:
                          EquipmentList[index].numSerie ?? "Vide",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          EquipmentList.add(Equipment(name: "nouveau", numSerie: "salut"));
          print("salut");
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined),
            label: "Bon d'inter",
          ),
        ],
      ),
    );
  }
}

class StockDescription extends StatelessWidget {
  int equipmentNumber;
  StockDescription({Key? key, required this.equipmentNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "XEFI LYON",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
                "2507 Avenue de l'Europe,\n69140 Rilleux-la-pape\n\n04 72 83 75 75\n"),
            Text("Il y a $equipmentNumber équipement",
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

class StockWidget extends StatelessWidget {
  String equipmentName;
  String equipmentNumSerie;
  StockWidget(
      {Key? key, required this.equipmentName, required this.equipmentNumSerie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: Padding(
          child: Column(
            children: [
              MyDescription(model: equipmentName, serial: equipmentNumSerie)
            ],
          ),
          //padding: EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}

class MyDescription extends StatelessWidget {
  final String? model, serial;
  const MyDescription({Key? key, this.model, this.serial}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(model ?? "rien :c",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text("n° de série : " + (serial ?? "rien :c")),
            const Text(
              "Info et historique => ",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                print("bonjour");
              },
              child: const Text('Modifier'),
            ),
          ],
        )
      ],
    );
  }
}
