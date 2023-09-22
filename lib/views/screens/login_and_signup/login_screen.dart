import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/login_and_signup/sign_up.dart';
import 'package:transportation_app/views/screens/main_screens/forgot_password.dart';
import 'package:transportation_app/views/screens/main_screens/home_screen.dart';
import '../../widgets/costum_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email, password;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("T System"),
            centerTitle: true,
            backgroundColor: AppColors.mainColor),
        body: SafeArea(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Stack(
                children: [
                  const Image(
                    image: AssetImage("assets/Login.png"),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2 - 75,
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
                        height: 15,
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
                            "New member?  ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            child: const Text(
                              " Register Now!",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xffAC3C39),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return ForgotPassword();
                            },
                          ));
                        },
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffAC3C39),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (formkey.currentState!.validate()) {
                            setState(() {});
                            if (email == "Test" && password == "Test") {
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const HomeScreen();
                                },
                              ));
                              isloading = false;
                              setState(() {});
                            } else {
                              Future.delayed(const Duration(seconds: 1));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Check your email and password")));
                              isloading = false;
                              setState(() {});
                            }
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          decoration: BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 35, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
