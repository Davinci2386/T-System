import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transportation_app/core/constants/app_colors.dart';

// ignore: must_be_immutable
class TaxiTime extends StatefulWidget {
  TaxiTime({super.key});
  static String id = "1";
  @override
  State<TaxiTime> createState() => _TaxiTimeState();
  TextEditingController dateInputController = TextEditingController();
  TextEditingController timeInputController = TextEditingController();

  TimeOfDay initialTime = TimeOfDay.now();
}

class _TaxiTimeState extends State<TaxiTime> {
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Set<String?> data =
        ModalRoute.of(context)!.settings.arguments as Set<String?>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request a taxi"),
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
                    "You are going from : ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "${data.elementAt(0)} ",
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Heading to : ",
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    "${data.elementAt(1)} ",
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
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Done!")));
                    /*
                  when the backend is ready
                  */
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
