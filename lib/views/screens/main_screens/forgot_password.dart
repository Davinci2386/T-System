import 'package:flutter/material.dart';
import 'package:transportation_app/core/constants/app_colors.dart';
import 'package:transportation_app/views/screens/login_and_signup/login_screen.dart';
import 'package:transportation_app/views/widgets/costum_textfield.dart';

// ignore: must_be_immutable
class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  GlobalKey<FormState> formkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ));
          },
        ),
        title: const Text("Restore Password"),
        centerTitle: true,
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(children: [
            Image.asset("assets/forgot_password.png"),
            costumTextField(
                icon: const Icon(Icons.lock),
                name: "Enter your email address",
                onchanged: (p0) {},
                security: false,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'This field is requierd';
                  }
                  final emailRegex = RegExp(
                    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                  );

                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Check your email")));
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginView();
                    },
                  ));
                } else {}
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(40)),
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
