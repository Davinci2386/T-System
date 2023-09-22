import 'package:flutter/material.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/main_screens/taxi_time.dart';
import 'package:transportation_app/views/widgets/costum_textfield.dart';

class TaxiRequest extends StatefulWidget {
  const TaxiRequest({super.key});

  @override
  State<TaxiRequest> createState() => _TaxiRequestState();
  static String id = "req";
}

class _TaxiRequestState extends State<TaxiRequest> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? location, target, phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Request a taxi"),
      ),
      body: Form(
        key: formkey,
        child: Column(children: [
          const SizedBox(
            height: 40,
          ),
          costumTextField(
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            validate: (value) {
              if (value!.isEmpty) {
                return 'This field is requierd';
              }
              return null;
            },
            name: "Enter your current locatin",
            onchanged: (p0) {
              location = p0;
            },
            security: false,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          costumTextField(
            icon: const Icon(
              Icons.location_searching,
              color: Colors.white,
            ),
            validate: (value) {
              if (value!.isEmpty) {
                return 'This field is requierd';
              }
              return null;
            },
            name: "Enter the target location",
            onchanged: (p0) {
              target = p0;
            },
            security: false,
            textInputType: TextInputType.name,
          ),
          const SizedBox(
            height: 30,
          ),
          costumTextField(
            icon: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            validate: (value) {
              if (value!.isEmpty) {
                return 'This field is requierd';
              }
              return null;
            },
            name: "Enter your phone number",
            onchanged: (p0) {
              phone = p0;
            },
            security: false,
            textInputType: TextInputType.number,
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              if (formkey.currentState!.validate()) {
                Navigator.pushNamed(context, TaxiTime.id,
                    arguments: {location, target, phone});
              }
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.mainColor),
              child: const Text(
                "Proceed",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
