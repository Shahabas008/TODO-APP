import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_app/util/utils.dart';

class Edittodolistcontroller extends GetxController {
  void editTodoList(String title, String description, String id) async {
    final body = {
      "title": title,
      "description": description,
    };
    final  url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final stored = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (stored.statusCode == 200) {
      Utils.showSuccessmessage(message: "List Updated Successfully.");
    } else {
      Utils.showerrormessage(message: "List Not Updated.");
    }
  }
}
