import 'package:flutter/material.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({
    super.key,
    required this.text,
    required this.label,
    required this.color,
  });

  final Color color;
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            color: Color.fromARGB(255, 180, 163, 163),
          ),
        ),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
