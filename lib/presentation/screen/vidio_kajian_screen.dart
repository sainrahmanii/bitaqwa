import 'package:bitaqwa_app/data/vidio_data.dart';
import 'package:bitaqwa_app/presentation/screen/detail_vidio_screen.dart';
import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class VidioKajianScreen extends StatelessWidget {
  const VidioKajianScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: const Text(
          'Vidio Kajian',
          style: TextStyle(
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
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailVidioScreen(
                    title: videos[index]['title']!,
                    ustadz: videos[index]['ustadz']!,
                    account: videos[index]['account']!,
                    url: videos[index]['url']!,
                    description: videos[index]['description']!,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(videos[index]['thumbnail']!),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          videos[index]['account']!,
                          style: const TextStyle(
                            fontFamily: 'PoppinsRegular',
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          videos[index]['ustadz']!,
                          style: TextStyle(
                            fontFamily: 'PoppinsMedium',
                            fontSize: 14,
                            color: Colors.red[500],
                          ),
                        ),
                        Text(
                          videos[index]['title']!,
                          style: const TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
