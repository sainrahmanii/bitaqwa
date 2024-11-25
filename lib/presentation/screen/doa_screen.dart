import 'package:bitaqwa_app/presentation/screen/doa_list_screen.dart';
import 'package:bitaqwa_app/presentation/widget/card_doa.dart';
import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: const Text(
          'Doa-doa',
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
      body: Column(
        children: [
          Image.asset('assets/images/bg_header_doa.png'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 16,
                crossAxisSpacing: 12,
                children: [
                  CardDoa(
                    image: 'assets/images/ic_doa_pagi_malam.png',
                    title: 'Pagi & Malam',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Rumah',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_rumah.png',
                    title: 'Rumah',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Rumah',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_makanan_minuman.png',
                    title: 'Makanan & Minuman',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Makanan & Minuman',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_perjalanan.png',
                    title: 'Perjalanan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Perjalanan',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_etika_baik.png',
                    title: 'Etika Baik',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Etika Baik',
                          ),
                        ),
                      );
                    },
                  ),
                  CardDoa(
                    image: 'assets/images/ic_doa_sholat.png',
                    title: 'Shalat',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DoaListScreen(
                            category: 'Shalat',
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
