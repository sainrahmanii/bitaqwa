import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DetailDoaScreen extends StatelessWidget {
  final String title;
  final String arabicText;
  final String translation;
  final String references;
  const DetailDoaScreen(
      {required this.title,
      required this.arabicText,
      required this.translation,
      required this.references,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'PoppinsMedium',
            color: Colors.white,
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
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/bg_detail_doa.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                spacing: 24,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 24,
                      color: ColorConstant.colorText,
                    ),
                  ),
                  Text(
                    arabicText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 24,
                      color: ColorConstant.colorText,
                    ),
                  ),
                  Text(
                    translation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 16,
                      color: Colors.blue[200],
                    ),
                  ),
                  Text(
                    references,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'PoppinsRegular',
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
