import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomNavigationDestination extends StatelessWidget {
  const CustomNavigationDestination({
    super.key,
    required this.icon,
    required this.iconSelected,
    required this.label,
  });

  final Widget icon;
  final Widget iconSelected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      icon: icon,
      selectedIcon: iconSelected,
      label: label,
    );
  }
}