import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:tt9_betweener_challenge/core/helper/api_respons.dart';
import 'package:tt9_betweener_challenge/core/util/constants.dart';
import 'package:tt9_betweener_challenge/provider/link_provider.dart';
//import 'package:tt9_betweener_challenge/core/util/constants.dart';
//import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/views_featuers/widgets/custom_text_form_field.dart';

class AddLink extends StatefulWidget {
  static String id = '/add_links';
  const AddLink({super.key});

  @override
  State<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends State<AddLink> {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // void submitAddLink() {
  //   if (_formKey.currentState!.validate()) {
  //     Map<String, dynamic> body = {
  //       'title': titleController.text,
  //       'link': linkController.text,
  //       'username': userNameController.text
  //     };

  //     // addLink(context, body).then((value) {
  //     //   Navigator.pop(context, true);
  //     // }).catchError((err) {
  //     //   // ignore: avoid_print
  //     //   print(err.toString());
  //     // });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Link'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: CustomTextFormField(
                controller: titleController,
                hint: 'Enter Title',
                label: 'Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the Title';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: CustomTextFormField(
                controller: linkController,
                hint: 'Enter link',
                label: 'link',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the link';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16),
              child: CustomTextFormField(
                controller: userNameController,
                hint: 'User Name',
                label: 'User Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter the User Name';
                  }
                  return null;
                },
              ),
            ),
            Consumer<LinkProvider>(builder: (_, linkProvider, __) {
              // print("===================================");
              // print(linkProvider.links.status);

              return ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all<Color>(kSecondaryColor),
                      padding: const WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 48, vertical: 16))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Map<String, String> body = {
                        'title': titleController.text,
                        'link': linkController.text,
                        'username': userNameController.text
                      };
                      linkProvider.addLinks(body);
                      Navigator.pop(context, true);
                    }
                  },
                  child: const Text(
                    "ADD",
                    style: TextStyle(color: Colors.black),
                  ));
            })

            // ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor:
            //             MaterialStateProperty.all<Color>(kSecondaryColor),
            //         padding: const MaterialStatePropertyAll(
            //             EdgeInsets.symmetric(horizontal: 48, vertical: 16))),
            //     onPressed: submitAddLink,
            //     child: const Text(
            //       "ADD",
            //       style: TextStyle(color: Colors.black),
            //     ))
          ],
        ),
      ),
    );
  }
}
