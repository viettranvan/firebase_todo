import 'package:flutter/material.dart';

class CheckPasswordValidate extends StatelessWidget {
  const CheckPasswordValidate({
    Key? key,
    required this.symbol,
    required this.detail,
    required this.condition,
  }) : super(key: key);

  final String symbol;
  final String detail;
  final bool condition;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(Icons.check_circle,
                color: condition ? Colors.green : Colors.grey, size: 15.0),
          ],
        ),
        Text(detail, style: TextStyle(fontStyle: FontStyle.italic)),
      ],
    );
  }
}
