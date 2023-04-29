import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/UI/widgets/custom_appbar.dart';
import 'package:rest_api_app/UI/widgets/textfield.dart';
import 'package:rest_api_app/controllers/addtodolistcontroller.dart';

class AddTodoList extends StatelessWidget {
  AddTodoList({super.key});
  final titlecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final descriptioncontroller = TextEditingController();
  final controller = Get.put(Addtodolistcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              const Custom_Appbar(
                iconbuttonenabler: true,
                textalign: false,
                title: "ADD TODO LIST",
                customfontsize: 20,
                customfontweight: FontWeight.bold,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Textfield(
                      controllernname: titlecontroller,
                      labelname: "Enter a Title",
                      custommaxlines: 1,
                    ),
                    Textfield(
                      controllernname: descriptioncontroller,
                      labelname: "Enter a Description",
                      custommaxlines: 5,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          minimumSize: const Size(350, 60),
                          backgroundColor:
                              const Color.fromARGB(255, 77, 76, 76),
                          shadowColor: Colors.black,
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.addTodoList(titlecontroller.text,
                                descriptioncontroller.text);
                          }
                          titlecontroller.clear();
                          descriptioncontroller.clear();
                        },
                        child: const Text(
                          "SUBMIT",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
