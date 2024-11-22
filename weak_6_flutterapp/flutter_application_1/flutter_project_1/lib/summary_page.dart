import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String? departureCity;
  final String? arrivalCity;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final int passengers;
  final String? classType;
  final double price;

  SummaryPage({
    required this.departureCity,
    required this.arrivalCity,
    required this.departureDate,
    required this.returnDate,
    required this.passengers,
    required this.classType,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Booking Summary")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Departure City: $departureCity",
                style: TextStyle(fontSize: 18)),
            Text("Arrival City: $arrivalCity", style: TextStyle(fontSize: 18)),
            Text("Departure Date: ${departureDate?.toLocal()}",
                style: TextStyle(fontSize: 18)),
            Text("Return Date: ${returnDate?.toLocal()}",
                style: TextStyle(fontSize: 18)),
            Text("Passengers: $passengers", style: TextStyle(fontSize: 18)),
            Text("Class: $classType", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text("Total Price: \$${price.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Confirmation logic or redirect to a confirmation page.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Booking Confirmed"),
                      content: Text(
                          "Your flight from $departureCity to $arrivalCity has been booked successfully!"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
