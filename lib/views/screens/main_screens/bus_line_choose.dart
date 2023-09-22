import 'package:flutter/material.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/main_screens/bus_request.dart';

// ignore: must_be_immutable
class BusRequest extends StatelessWidget {
  BusRequest({super.key});
  List<int> lines = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose a line"),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, BusTime.id,
                    arguments: "Line: ${index + 1}");
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: AppColors.mainColor),
                child: Center(
                    child: Row(
                  children: [
                    Image.asset(
                      "assets/line.png",
                      height: 100,
                      width: 200,
                    ),
                    Text(
                      "Line: ${lines[index]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )),
              ),
            );
          },
          itemCount: lines.length),
    );
  }
}
