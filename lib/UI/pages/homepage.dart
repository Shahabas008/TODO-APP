import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_app/config/routes.dart';
import 'package:rest_api_app/ui/widgets/custom_appbar.dart';
import 'package:rest_api_app/util/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isLoading = true;
List items = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    displayList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Custom_Appbar(
              iconbuttonenabler: false,
              title: "TODO LIST",
              customfontsize: 21,
              customfontweight: FontWeight.bold,
              textalign: true,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  minimumSize: const Size(350, 60),
                  backgroundColor: const Color.fromARGB(255, 77, 76, 76),
                  shadowColor: Colors.black,
                ),
                onPressed: () {
                  Get.toNamed(ADDTODO_ROUTE);
                },
                child: const Text(
                  "ADD TODO LIST",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Visibility(
                 child: const Center(
                  child: CircularProgressIndicator(),
                ),
                visible: isLoading,
                replacement: RefreshIndicator(
                  onRefresh: displayList,
                  child: Visibility(
                    visible: items.isNotEmpty,
                    replacement: const Center(child: Text("No todo list",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),),),
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index] as Map;
                          final id = item["_id"] as String;
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundColor:
                                    const Color.fromARGB(255, 77, 76, 76),
                                foregroundColor: Colors.white,
                                child: Text('${index + 1}')),
                            title: Text(item["title"]),
                            subtitle: Text(item["description"]),
                            trailing: PopupMenuButton(onSelected: (value) {
                              if (value == "edit") {
                                Get.toNamed(EDITTODO_ROUTE,
                                    arguments: {"todo": item});
                              } else if (value == "delete") {
                                deleteTodolist(id);
                              }
                            }, itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: "edit",
                                  child: Text("Edit"),
                                ),
                                const PopupMenuItem(
                                  value: "delete",
                                  child: Text("Delete"),
                                )
                              ];
                            }),
                          );
                        }),
                  ),
                ),
               
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> displayList() async {
    setState(() {
      isLoading = true;
    });
    const url = "https://api.nstack.in/v1/todos?page=1&limit=20";
    final uri = Uri.parse(url);
    final responds = await http.get(uri);
    if (responds.statusCode == 200) {
      final json = jsonDecode(responds.body) as Map;
      final results = json["items"] as List;
      setState(() {
        items = results;
      });
    } else {
      Utils.showerrormessage(message: "Unable to display the saved todo list.");
    }
    setState(() {
      isLoading = false;
    });
  }

  void deleteTodolist(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      Utils.showSuccessmessage(message: "The list deleted successfully.");
      final filtered = items.where((element) => element["_id"] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      Utils.showerrormessage(
          message: "There is some error to delete the list.");
    }
  }
}
