import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rest_api_app/UI/pages/edittodolist.dart';
import 'package:rest_api_app/UI/pages/homepage.dart';
import 'package:rest_api_app/config/routes.dart';
import 'package:rest_api_app/ui/pages/addtodolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: INITIAL_ROUTE,
        getPages: [
          GetPage(name: INITIAL_ROUTE, page: () => const HomeScreen()),
          GetPage(name: ADDTODO_ROUTE, page: () =>  AddTodoList()),
          GetPage(name: EDITTODO_ROUTE, page: () =>  EditTodoList()),

        ]);
  }
}
