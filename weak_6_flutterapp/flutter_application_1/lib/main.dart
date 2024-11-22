import 'package:flutter/material.dart';
import 'car.dart';
import 'warantywidget.dart';
import 'insurance_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  List<Car> cars = [
    Car(model: "toyota", price: 4000),
    Car(model: "BMW", price: 6000),
    Car(model: "Audi", price: 8000),
  ];
  int warrenty = 1;
  bool hasInsurance = false;
  double totalPrice = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Buy a Car'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text('Select a maodel'),

              DropdownMenu(
                dropdownMenuEntries: cars.map<DropdownMenuEntry<Car>>((Car c) {
                  return DropdownMenuEntry(
                      value: c, label: "${c.model}-${c.price}\$");
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              WarantyWidget(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     const Text(' Waranty'),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     Radio(
              //         value: 1,
              //         groupValue: warrenty,
              //         onChanged: (selectedWarranty) {
              //           setState(() {
              //             warrenty = selectedWarranty as int;
              //           });
              //         }),
              //     const Text('1 Year'),
              //     Radio(
              //         value: 5,
              //         groupValue: warrenty,
              //         onChanged: (selectedWarranty) {
              //           warrenty = selectedWarranty as int;
              //         }),
              //     const Text('5 Year'),
              //   ],
              // ),
              Row(
                children: [
                  const Text("Insurance"),
                  Checkbox(
                      value: hasInsurance,
                      onChanged: (selectedInsurance) {
                        setState(() {
                          hasInsurance = selectedInsurance as bool;
                        });
                      }),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Total Price:$totalPrice'),

              //option abel howe el entry bel dropmenu:entry hon azde kel entry 3nda value wlabel el lebel ele am tbyn bselect
              //map lhta hwl mn list of car la list of enties
            ],
          ),
        ),
      ),
    );
  }
}
       
     
 

// This is the theme of your application.
//
// TRY THIS: Try running your application with "flutter run". You'll see
// the application has a purple toolbar. Then, without quitting the app,
// try changing the seedColor in the colorScheme below to Colors.green
// and then invoke "hot reload" (save your changes or press the "hot
// reload" button in a Flutter-supported IDE, or press "r" if you used
// the command line to start the app).
//
// Notice that the counter didn't reset back to zero; the application
// state is not lost during the reload. To reset the state, use hot
// restart instead.
//
// This works for code too, not just values: Most code changes can be
// tested with just a hot reload.



  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    