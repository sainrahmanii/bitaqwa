import 'package:flutter/material.dart';

class CardResultHarta extends StatelessWidget {
  final String title;
  final String result;
  final Color color;

  const CardResultHarta({
    required this.title,
    required this.result,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'PoppinsMedium',
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            result,
            style: const TextStyle(
              fontFamily: 'PoppinsMedium',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
