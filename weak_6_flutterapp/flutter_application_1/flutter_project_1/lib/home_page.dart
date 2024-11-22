import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedDepartureCity;
  String? selectedArrivalCity;
  DateTime? departureDate;
  DateTime? returnDate;
  int numberOfPassengers = 1;
  String? selectedClass;
  TextEditingController discountController = TextEditingController();
  double totalPrice = 1000.0;

  // Dummy cities and prices
  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'San Francisco'
  ];
  final List<String> classes = ['Economy', 'Business', 'First Class'];

  void calculatePrice() {
    totalPrice = 1000.0; // base price for economy class
    if (selectedClass == 'Business') totalPrice *= 1.5;
    if (selectedClass == 'First Class') totalPrice *= 2.0;
    totalPrice *= numberOfPassengers;

    // Apply discount if any
    if (discountController.text.isNotEmpty) {
      totalPrice *= 0.9; // 10% discount
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flight Booking System")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedDepartureCity,
              hint: Text("Select Departure City"),
              onChanged: (value) {
                setState(() {
                  selectedDepartureCity = value;
                });
              },
              items: cities.map<DropdownMenuItem<String>>((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedArrivalCity,
              hint: Text("Select Arrival City"),
              onChanged: (value) {
                setState(() {
                  selectedArrivalCity = value;
                });
              },
              items: cities.map<DropdownMenuItem<String>>((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() {
                          departureDate = date;
                        });
                      }
                    },
                    child: Text(departureDate == null
                        ? 'Select Departure Date'
                        : 'Departure Date: ${departureDate?.toLocal()}'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() {
                          returnDate = date;
                        });
                      }
                    },
                    child: Text(returnDate == null
                        ? 'Select Return Date'
                        : 'Return Date: ${returnDate?.toLocal()}'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text("Passengers: "),
                Expanded(
                  child: Slider(
                    min: 1,
                    max: 10,
                    divisions: 9,
                    value: numberOfPassengers.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        numberOfPassengers = value.toInt();
                      });
                    },
                  ),
                ),
                Text("$numberOfPassengers"),
              ],
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedClass,
              hint: Text("Select Class"),
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
              items: classes.map<DropdownMenuItem<String>>((String className) {
                return DropdownMenuItem<String>(
                  value: className,
                  child: Text(className),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: discountController,
              decoration:
                  InputDecoration(labelText: "Discount Code (Optional)"),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculatePrice();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SummaryPage(
                      departureCity: selectedDepartureCity,
                      arrivalCity: selectedArrivalCity,
                      departureDate: departureDate,
                      returnDate: returnDate,
                      passengers: numberOfPassengers,
                      classType: selectedClass,
                      price: totalPrice,
                    ),
                  ),
                );
              },
              child: Text("Proceed to Summary"),
            ),
          ],
        ),
      ),
    );
  }
}
