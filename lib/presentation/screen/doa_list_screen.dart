import 'package:bitaqwa_app/data/data_list_doa.dart';
import 'package:bitaqwa_app/presentation/screen/detail_doa_screen.dart';
import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';

class DoaListScreen extends StatelessWidget {
  final String category;
  const DoaListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doaList = getDoaList(category);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.colorPrimary,
        title: const Text(
          'List Doa',
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
        itemCount: doaList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 16,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!,
                      blurRadius: 3,
                      spreadRadius: 1,
                    )
                  ]),
              child: ListTile(
                leading: Image.asset(doaList[index]['image']!),
                title: Text(
                  doaList[index]['title']!,
                  style: const TextStyle(
                    fontFamily: 'PoppinsMedium',
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailDoaScreen(
                        title: doaList[index]['title']!,
                        arabicText: doaList[index]['arabicText']!,
                        translation: doaList[index]['translation']!,
                        references: doaList[index]['reference']!,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
