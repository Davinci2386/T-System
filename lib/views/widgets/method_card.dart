import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

// ignore: must_be_immutable
class MethodCard extends StatelessWidget {
  MethodCard(
      {super.key,
      required this.hours,
      required this.imagePath,
      required this.methodName});
  String hours, methodName, imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: AppColors.mainColor),
      child: Column(
        children: [
          Text(
            methodName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Image(
            image: AssetImage(imagePath),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            hours,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
