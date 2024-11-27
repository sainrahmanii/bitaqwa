import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  final String pray;
  final String time;
  final String image;

  const Time({
    super.key,
    required this.pray,
    required this.time,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          pray,
          style: const TextStyle(
            fontFamily: 'PoppinsMedium',
            fontSize: 16,
          ),
        ),
        const Spacer(),
        Text(
          time,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: 'PoppinsRegular',
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Image.asset(image),
      ],
    );
  }
}
