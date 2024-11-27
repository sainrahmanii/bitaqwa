import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_header_dashboard_morning.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'Assalamualaikum Husain',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'PoppinsMedium',
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            const Text(
              'Dzuhur',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'PoppinsMedium',
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Text(
              '12.12',
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
                fontFamily: 'PoppinsBold',
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'IDN Backpacker School Sentul',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'PoppinsRegular',
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget cardMenus() {
      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorConstant.colorPrimary,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'doa');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_doa.png'),
                    const Text(
                      'Doa-doa',
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'zakat');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_zakat.png'),
                    const Text(
                      'Zakat',
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'jadwal-shalat');
                },
                child: Column(
                  children: [
                    Image.asset('assets/images/ic_menu_jadwal_sholat.png'),
                    const Text(
                      'Jadwal Shalat',
                      style: TextStyle(
                        fontFamily: 'PoppinsRegular',
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Image.asset('assets/images/ic_menu_video_kajian.png'),
                  const Text(
                    'Video Kajian',
                    style: TextStyle(
                      fontFamily: 'PoppinsRegular',
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget cardInpiration() {
      return Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Inspiration',
              style: TextStyle(
                fontFamily: 'PoppinsSemiBold',
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Image.asset('assets/images/img_inspiration.png'),
            const SizedBox(
              height: 8,
            ),
            Image.asset('assets/images/img_inspiration.png')
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          header(),
          cardMenus(),
          cardInpiration(),
        ],
      ),
    );
  }
}
