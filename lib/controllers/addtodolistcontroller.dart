import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/util/utils.dart';

class Addtodolistcontroller extends GetxController {
  void addTodoList(String title, String description) async {
    final titles = title;
    final descriptions = description;
    final body = {
      "title": titles,
      "description": descriptions,
    };
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final stored = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (stored.statusCode == 201) {
      Utils.showSuccessmessage(message: "List Added Successfully.");
    } else {
      Utils.showerrormessage(message: "List Not Added.");
    }
  }
}
