import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension Modify on FaIcon{
  FaIcon modify(
    double size, 
    Color color, 
    IconData icon
  ) => FaIcon(
    icon,
    color: color,
    size: size,
  );
}

