/*
  ---------------------------------------
  Project: Bond Band Mobile Application
  Date: March 03, 2026
  Author: Ameer Salman
  ---------------------------------------
  Description: custom tab bar
*/

import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController controller;
  final List<Tab> tabs;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color labelColor;
  final Color unselectedLabelColor;

  const CustomTabBar({
    Key? key,
    required this.controller,
    required this.tabs,
    required this.backgroundColor,
    required this.indicatorColor,
    required this.labelColor,
    required this.unselectedLabelColor,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorColor: indicatorColor,
        labelColor: labelColor,
        unselectedLabelColor: unselectedLabelColor,
      ),
    );
  }
}
// Expanded(child: JobGrid(showAppBar: false)),
