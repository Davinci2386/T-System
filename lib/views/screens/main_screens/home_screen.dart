import 'package:flutter/material.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/main_screens/bus_line_choose.dart';
import 'package:transportation_app/views/screens/main_screens/metro_line_choose.dart';
import 'package:transportation_app/views/screens/main_screens/taxi_request.dart';

import '../../widgets/method_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double wi = 100;
  double hi = 100;
  BorderRadius border = BorderRadius.circular(12);
  Color color = AppColors.mainColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("T System"), centerTitle: true),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(25.0),
            child: Text(
              "Here you have to add the vehicle you use\n and the time you use it",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return BusRequest();
                        },
                      ));
                    },
                    child: MethodCard(
                      methodName: "Bus",
                      hours: "Working time : 7 days from 8:00 to 8:00",
                      imagePath: "assets/bus.png",
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MetroRequest();
                        },
                      ));
                    },
                    child: MethodCard(
                        hours: "24/7",
                        imagePath: "assets/metro.png",
                        methodName: "Metro"),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const TaxiRequest();
                        },
                      ));
                    },
                    child: MethodCard(
                        hours: "24/7",
                        imagePath: "assets/taxi.png",
                        methodName: "Taxi"),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
