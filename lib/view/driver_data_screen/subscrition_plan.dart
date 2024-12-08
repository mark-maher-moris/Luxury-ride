import 'package:flutter/material.dart';

class SubscritionPlan extends StatelessWidget {
  const SubscritionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Subscrition Plan"),
          Card(
              child: Column(
            children: [
              Text('Base Plan'),
              Text('1 Month'),
              Text('10 Rides'),
              Text('50 km travel rides'),
              Text('Try Free'),
              Text('Buy At \$20')
            ],
          ))
        ],
      )),
    ));
  }
}
