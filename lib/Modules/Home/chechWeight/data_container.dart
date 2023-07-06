import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  static const textStyle1 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 20.0,
  );
  static const textStyle2 = TextStyle(
    color: Color(0xFF000000),
    fontSize: 60.0,
    fontWeight: FontWeight.w900
  );
  static const textStyle3 = TextStyle(
      color: Color(0xFFffffff),
      fontSize: 30.0,
      fontWeight: FontWeight.w900
  );

  const DataContainer({ required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(height: 15.0),
        Text(
          title,
          style: textStyle1
        ),
      ],
    );
  }
}
