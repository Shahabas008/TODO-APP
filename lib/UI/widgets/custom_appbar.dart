import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custom_Appbar extends StatelessWidget {
  const Custom_Appbar({
    Key? key,
    required this.iconbuttonenabler,
    required this.textalign,
    required this.title,
    required this.customfontsize,
    required this.customfontweight,
    this.actions = const [],
  }) : super(key: key);
  final String title;
  final bool textalign;
  final bool iconbuttonenabler;
  final double customfontsize;
  final List<Map> actions;
  final FontWeight? customfontweight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          iconbuttonenabler == true
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                  ))
              : const SizedBox(
                  width: 10,
                ),
          textalign == true
              ? const SizedBox(
                  width: 140,
                )
              : const SizedBox(),
          Text(
            title,
            style: TextStyle(
              fontSize: customfontsize,
              fontWeight: customfontweight,
            ),
          ),
          actions.isNotEmpty
              ? Row(
                  children: actions
                      .map((action) => SizedBox(
                            width: 40,
                            child: IconButton(
                                onPressed: () {
                                  action["OnPressed"];
                                },
                                icon: action["icon"]),
                          ))
                      .toList())
              : const SizedBox(
                  width: 40,
                )
        ],
      ),
    );
  }
}
