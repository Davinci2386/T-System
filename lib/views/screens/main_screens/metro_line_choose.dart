import 'package:flutter/material.dart';
import 'package:transportation_app/views/screens/main_screens/metro_request.dart';

import '../../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class MetroRequest extends StatelessWidget {
  MetroRequest({super.key});
  List<int> l = [1, 2, 3, 4, 5, 6, 7, 8];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request a ticket"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, MetroTime.id, arguments: index + 1);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: AppColors.mainColor),
              child: Row(
                children: [
                  Image.asset(
                    "assets/metroLine.png",
                    height: 100,
                    width: 200,
                  ),
                  Text(
                    "Line: ${l[index]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: l.length,
      ),
    );
  }
}
