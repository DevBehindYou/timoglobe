import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(80);
  final String text;
  MyAppBar({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xff29283A),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}
