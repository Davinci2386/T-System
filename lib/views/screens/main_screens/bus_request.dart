import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transportation_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class BusTime extends StatefulWidget {
  BusTime({super.key});
  @override
  State<BusTime> createState() => _BusTimeState();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController timeInputController = TextEditingController();

  TimeOfDay initialTime = TimeOfDay.now();
  static String id = "Bus";
}

class _BusTimeState extends State<BusTime> {
  GlobalKey<FormState> formkey = GlobalKey();
  Map<String, int> m = {"Bus": 0};

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
                    "You are using : ",
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
                    m["Bus"] = widget.initialTime.minute;
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
                    if (widget.initialTime.hour >= 8 &&
                        widget.initialTime.hour <= 20) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "the nearest bus from your date is : ${20 - m["Bus"]! % 20} minutes after it")));
                      /*
                  when the backend is ready
                  */
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Sorry your time is out the buses service times")));
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
