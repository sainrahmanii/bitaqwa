import 'package:bitaqwa_app/presentation/widget/card_result_harta.dart';
import 'package:bitaqwa_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';

class ZakatScreen extends StatefulWidget {
  const ZakatScreen({super.key});

  @override
  State<ZakatScreen> createState() => _ZakatScreenState();
}

class _ZakatScreenState extends State<ZakatScreen> {
  final MoneyMaskedTextController controller = MoneyMaskedTextController(
    thousandSeparator: '.',
    precision: 0,
    decimalSeparator: '',
  );

  double totalHarta = 0;
  double zakatDikeluarkan = 0;
  final double minimumharta = 85000000;

  String formattedTotalHarta = '';
  String formattedZakatDikeluarkan = '';

  void hitungZakat() {
    String cleanValue = controller.text.replaceAll('.', '');
    double inputValue = double.tryParse(cleanValue) ?? 0;

    if (inputValue >= minimumharta) {
      setState(() {
        totalHarta = inputValue;
        zakatDikeluarkan = (totalHarta * 2.5) / 100;
      });

      formattedTotalHarta =
          NumberFormat.currency(locale: 'id_ID', symbol: '').format(totalHarta);

      formattedZakatDikeluarkan =
          NumberFormat.currency(locale: 'id_ID', symbol: '')
              .format(zakatDikeluarkan);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Peringatan'),
          content: const Text('Total Harta belum mencapai hisab (85 gr)'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget cardHarta() {
      return Container(
        padding: const EdgeInsets.all(24),
        margin: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Harta',
              style: TextStyle(
                fontFamily: 'PoppinsMedium',
                fontSize: 16,
                color: ColorConstant.colorPrimary,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukan Total Harta',
                labelStyle: TextStyle(
                  color: ColorConstant.colorText,
                  fontSize: 14,
                ),
                fillColor: Colors.white,
                filled: true,
                prefixText: 'Rp ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.colorPrimary,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: ColorConstant.colorPrimary,
                    width: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                hitungZakat();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.colorPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(12),
                minimumSize: const Size(double.infinity, 0),
              ),
              child: const Text(
                'OK',
                style: TextStyle(
                  fontFamily: 'PoppinsMedium',
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget cardResultHarta(
        String formattedTotalHarta, String formattedZakatDikeluarkan) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          CardResultHarta(
            title: 'Total Uang',
            color: ColorConstant.colorPrimary,
            result: 'Rp $formattedTotalHarta',
          ),
          CardResultHarta(
            title: 'Zakat Dikeluarkan',
            color: Colors.purpleAccent,
            result: 'Rp $formattedZakatDikeluarkan',
          ),
        ],
      );
    }

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
      body: ListView(
        children: [
          Image.asset('assets/images/bg_header_zakat.png'),
          cardHarta(),
          cardResultHarta(
            formattedTotalHarta,
            formattedZakatDikeluarkan,
          ),
        ],
      ),
    );
  }
}
