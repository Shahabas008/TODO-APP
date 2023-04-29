import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/UI/widgets/custom_appbar.dart';
import 'package:rest_api_app/UI/widgets/textfield.dart';
import 'package:rest_api_app/controllers/edittodocontroller.dart';

class EditTodoList extends StatefulWidget {
  EditTodoList({super.key});

  @override
  State<EditTodoList> createState() => _EditTodoListState();
}

class _EditTodoListState extends State<EditTodoList> {
  final titlecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final descriptioncontroller = TextEditingController();
  final data = Get.arguments["todo"];
  final controller = Get.put(Edittodolistcontroller());
  @override
  void initState() {
    super.initState();
    final edittitle = data["title"];
    final editdescription = data["description"];
    titlecontroller.text = edittitle;
    descriptioncontroller.text = editdescription;
  }

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
                title: "EDIT TODO LIST",
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
                          controller.editTodoList(titlecontroller.text,
                              descriptioncontroller.text, data['_id']);
                        },
                        child: const Text(
                          "UPDATE",
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
