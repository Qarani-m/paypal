import 'package:flutter/material.dart';

class NavItem {
  final String label;
  final String svgPath;
  final Widget? page;

  const NavItem({
    required this.label,
    required this.svgPath,
    this.page,
  });
}