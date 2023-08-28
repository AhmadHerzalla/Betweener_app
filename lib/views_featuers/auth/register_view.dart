import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:tt9_betweener_challenge/core/helper/shared_prefs.dart';
import 'package:tt9_betweener_challenge/core/util/assets.dart';
import 'package:tt9_betweener_challenge/controllers/register_controller.dart';
//import 'package:tt9_betweener_challenge/models/register.dart';
//import 'package:tt9_betweener_challenge/models/user.dart';
import 'package:tt9_betweener_challenge/views_featuers/main_app_view.dart';
import 'package:tt9_betweener_challenge/views_featuers/widgets/custom_text_form_field.dart';
import 'package:tt9_betweener_challenge/views_featuers/widgets/google_button_widget.dart';
import 'package:tt9_betweener_challenge/views_featuers/widgets/secondary_button_widget.dart';

//import '../../views/widgets/google_button_widget.dart';

class RegisterView extends StatefulWidget {
  static String id = '/registerView';

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void submitLogin() {
    if (_formKey.currentState!.validate()) {
      final body = {
        'name': nameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'password_confirmation': confirmationPasswordController.text
      };

      register(body).then((user) async {
        print(body);

        //save user locally
        //  SharedPrefsController().setData('token', user.token);
        //SharedPrefsController().setData('user', user);
        SharedPrefsController().setData('user', jsonEncode(user));
        // final SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setString('user', registerToJson(user));

        if (mounted) {
          Navigator.pushNamed(context, MainAppView.id);
        }
      }).catchError((err) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(err.toString()),
          backgroundColor: Colors.red,
        ));
      });

      // Navigator.pushNamed(context, MainAppView.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          //replace with our own icon data.
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Spacer(),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                      child: Hero(
                          tag: 'authImage',
                          child: SvgPicture.asset(AssetsData.authImage))),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    hint: 'John Doe',
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    hint: 'example@gmail.com',
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    hint: 'Enter password',
                    label: 'password',
                    password: true,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTextFormField(
                    controller: confirmationPasswordController,
                    hint: 'Enter confirmation password',
                    label: 'confirmation password',
                    password: true,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SecondaryButtonWidget(
                      onTap: () {
                        submitLogin();
                      },
                      text: 'REGISTER'),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '-  or  -',
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GoogleButtonWidget(onTap: () {}),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
