import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transportation_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class MetroTime extends StatefulWidget {
  MetroTime({super.key});
  @override
  State<MetroTime> createState() => _MetroTimeState();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController timeInputController = TextEditingController();

  TimeOfDay initialTime = TimeOfDay.now();
  static String id = "Metro";
}

class _MetroTimeState extends State<MetroTime> {
  GlobalKey<FormState> formkey = GlobalKey();
  Map<String, int> m = {"Metro": 0};

  @override
  Widget build(BuildContext context) {
    String line = ModalRoute.of(context)!.settings.arguments.toString();
    Set<String> data = {};
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose the time"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                children: [
                  const Text(
                    "You are using line : ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    line,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please choose your time and date:",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'This field is requierd';
                      }
                      return null;
                    },
                    readOnly: true,
                    autofocus: false,
                    controller: widget.dateInputController,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime(2050));

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(() {
                          widget.dateInputController.text = formattedDate;
                          data.add(widget.dateInputController.text);
                        });
                      }
                    },
                    decoration: InputDecoration(
                        icon: const Icon(Icons.calendar_today),
                        hintText: 'Date',
                        enabled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field is requierd';
                    }
                    return null;
                  },
                  controller: widget.timeInputController,
                  readOnly: true,
                  autofocus: false,
                  onTap: () async {
                    widget.initialTime = (await showTimePicker(
                        context: context, initialTime: widget.initialTime))!;
                    m["Metro"] = widget.initialTime.minute;
                    // ignore: use_build_context_synchronously
                    String formattedTime = widget.initialTime.format(context);
                    setState(() {
                      widget.timeInputController.text = formattedTime;
                      data.add(widget.timeInputController.text);
                    });
                  },
                  decoration: InputDecoration(
                    icon: const Icon(Icons.timelapse),
                    hintText: 'Time',
                    enabled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    if (m["Metro"] == 0) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(content: Text("Done")));
                      /*
                  when the backend is ready
                  */
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "the nearest Metro after your date is : ${60 - m["Metro"]! % 60} minutes after it")));
                      /*
                  when the backend is ready
                  */
                    }
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Text(
                    "Order!",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
