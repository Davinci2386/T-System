import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/login_and_signup/login_screen.dart';
import 'package:transportation_app/views/screens/main_screens/bus_request.dart';
import 'package:transportation_app/views/screens/main_screens/metro_request.dart';
import 'package:transportation_app/views/screens/main_screens/taxi_request.dart';
import 'package:transportation_app/views/screens/main_screens/taxi_time.dart';

MaterialColor costumColor = MaterialColor(0xffAC3C39, color);
Map<int, Color> color = {
  50: const Color.fromRGBO(172, 60, 57, .1),
  100: const Color.fromRGBO(172, 60, 57, .2),
  200: const Color.fromRGBO(172, 60, 57, .3),
  300: const Color.fromRGBO(172, 60, 57, .4),
  400: const Color.fromRGBO(172, 60, 57, .5),
  500: const Color.fromRGBO(172, 60, 57, .6),
  600: const Color.fromRGBO(172, 60, 57, .7),
  700: const Color.fromRGBO(172, 60, 57, .8),
  800: const Color.fromRGBO(172, 60, 57, .9),
  900: const Color.fromRGBO(172, 60, 57, 1),
};
void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    try {
      final player = AudioPlayer();
      player.play(AssetSource('speaker.wav'));
      player.resume();
    } catch (error) {
      if (kDebugMode) {
        print("E: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: AppColors.mainColor, primarySwatch: costumColor),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      routes: {
        TaxiRequest.id: (context) => const TaxiRequest(),
        TaxiTime.id: (context) => TaxiTime(),
        BusTime.id: (context) => BusTime(),
        MetroTime.id: (context) => MetroTime()
      },
    );
  }
}
