import 'package:e_booktique/constants/themes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AdsBannersWidget extends StatelessWidget {
  const AdsBannersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Tienda de Libros',
                  style: AppTheme.kBigTitle,
                ),
                const Gap(4),
                Text(
                  'Encuentra el Libro ideal con nuestra gran variedad',
                  style: AppTheme.kBodyText.copyWith(color: kWhiteColor),
                ),
                const Gap(8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kWhiteColor,
                    foregroundColor: kSecondaryColor,
                  ),
                  onPressed: () {},
                  child: const Text('Comprar Ahora'),
                ),
              ],
            ),
          ),
          Image.asset('assets/romance_books/1.png'),
        ],
      ),
    );
  }
}
