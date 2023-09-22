import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:transportation_app/views/screens/main_screens/home_screen.dart';
import '../../../core/constants/app_colors.dart';
import '../../widgets/costum_textfield.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  RegExp digitRegExp = RegExp(r'\d');
  List<String> options = ['Male', 'Female'];
  String? current;
  bool autovalidate = false;
  TextEditingController dateInputController = TextEditingController();
  String? email, name, password, gender, birthdate;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;

  bool hasRequiredCharacters(String input) {
    RegExp uppercaseRegex = RegExp(r'[A-Z]');
    RegExp lowercaseRegex = RegExp(r'[a-z]');
    //RegExp digitRegex = RegExp(r'[0-9]');
    return uppercaseRegex.hasMatch(input) && lowercaseRegex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_conditional_assignment
    if (current == null) {
      current = options[0];
    }
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sign Up"),
        ),
        body: Form(
          key: formkey,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "T System",
                    style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Welcome to the transportation comunity",
                    style: TextStyle(color: Color(0xffAC3C39), fontSize: 18),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  costumTextField(
                    textInputType: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is requierd';
                      }
                      return null;
                    },
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    name: 'Email (use : Test)',
                    security: false,
                    onchanged: (p0) {
                      email = p0;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  costumTextField(
                    textInputType: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'This field is requierd';
                      }
                      return null;
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    name: "Name (use : Test)",
                    security: false,
                    onchanged: (value) {
                      name = value;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  costumTextField(
                    textInputType: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'field is required';
                      } else if (value.length < 3) {
                        return 'password should be more than 3 charechters';
                      } else if (!hasRequiredCharacters(value)) {
                        return 'password should have a capital, small letters and number ';
                      }
                      return null;
                    },
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    name: 'Password (use : Test)',
                    security: true,
                    onchanged: (p0) {
                      password = p0;
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ));
                        },
                        child: const Text(
                          " Login!",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffAC3C39),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        if (email == "Test" &&
                            password == "Test" &&
                            name == "Test") {
                          isloading = true;
                          setState(() {});
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ));
                          setState(() {
                            isloading = false;
                          });
                        }
                      }

                      isloading = false;
                      setState(() {});
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "® K5tb5",
                    style: TextStyle(fontSize: 22, color: AppColors.mainColor),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
