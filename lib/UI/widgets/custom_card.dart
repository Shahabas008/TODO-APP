import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.item,
  }) : super(key: key);
  final String item;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          
        });
  }
}
