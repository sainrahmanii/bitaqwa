import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class ZakatScreen extends StatelessWidget {
  const ZakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: const Text(
          'Zakat',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PoppinsMedium',
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Zakat Screen',
          style: TextStyle(
            fontFamily: 'PoppinsMedium',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}