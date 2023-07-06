import 'package:flutter/material.dart';

class ContainerBox extends StatelessWidget {
  const ContainerBox({required this.boxColor, required this.childWidget});

  final Color boxColor;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: boxColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5.0,
            blurRadius: 7.0,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: childWidget,
    );
  }
}
