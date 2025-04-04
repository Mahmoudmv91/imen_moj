import 'package:flutter/material.dart';
import 'package:imen_moj/config/theme/colors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(15),
      ),
      child: Container(
        color: AColors.backgroundDrawer,
        width: MediaQuery.of(context).size.width * .8,
      ),
    );
  }
}
