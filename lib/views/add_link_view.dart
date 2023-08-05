import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/constants.dart';
import 'package:tt9_betweener_challenge/controllers/link_controller.dart';
import 'package:tt9_betweener_challenge/views/widgets/custom_text_form_field.dart';

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

  void submitAddLink() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> body = {
        'title': titleController.text,
        'link': linkController.text,
        'username': userNameController.text
      };
      addLink(context, body).then((value) {
        Navigator.pop(context, true);
      }).catchError((err) {
        // ignore: avoid_print
        print(err.toString());
      });
    }
  }

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

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
            //   child: TextField(
            //     controller: titleController,
            //     decoration: InputDecoration(
            //       label: const Text("title"),
            //       hintText: 'Enter Title',
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),

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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
            //   child: TextField(
            //     controller: linkController,
            //     decoration: InputDecoration(
            //       label: const Text("link"),
            //       hintText: "Enter link",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 32,
            // ),
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

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 32.0),
            //   child: TextField(
            //     controller: userNameController,
            //     decoration: InputDecoration(
            //       label: const Text("user name"),
            //       hintText: "user name",
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 32,
            // ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kSecondaryColor),
                    padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 48, vertical: 16))),
                onPressed: submitAddLink,
                child: const Text(
                  "ADD",
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
