import 'package:e_booktique/constants/themes.dart';
import 'package:e_booktique/controllers/product_controllers.dart';
import 'package:e_booktique/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class DetailsPage extends ConsumerWidget {
  DetailsPage({super.key, required this.getIndex});

  int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final product = ref.watch(productNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Detalles del Libro'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              width: double.infinity,
              height: 300,
              color: klightBackground,
              child: Image.asset(product[getIndex].imgUrl),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product[getIndex].title,
                    style: AppTheme.kBigTitle.copyWith(color: kPrimaryColor),
                  ),
                  const Gap(12),
                  Row(
                    children: [
                      RatingBar(
                        itemPadding: const EdgeInsets.all(3),
                        glow: true,
                        itemSize: 15,
                        initialRating: 1,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: false,
                        ratingWidget: RatingWidget(
                            empty: const Icon(
                              FontAwesomeIcons.star,
                              color: Colors.amber,
                            ),
                            full: const Icon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              FontAwesomeIcons.solidStarHalf,
                              color: Colors.amber,
                            )),
                        onRatingUpdate: (value) => null,
                      ),
                      const Gap(12),
                      const Text('125 Review')
                    ],
                  ),
                  const Gap(8),
                  Text(product[getIndex].description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' '${product[getIndex].price}',
                        style: AppTheme.kHeadingOne,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.circlePlus),
                          ),
                          Text(
                            product[getIndex].cantidad.toString(),
                            style: AppTheme.kCardTitle.copyWith(fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.circleMinus),
                          ),
                        ],
                      )
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Añadir al Carrito',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) =>
            ref.read(currentIndexProvider.notifier).update((state) => value),
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: kSecondaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: 'Inicio',
            activeIcon: Icon(
              FontAwesomeIcons.house,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.heart,
            ),
            label: 'Favoritos',
            activeIcon: Icon(
              FontAwesomeIcons.solidHeart,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.compass,
            ),
            label: 'Localización',
            activeIcon: Icon(
              FontAwesomeIcons.solidCompass,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.bell,
            ),
            label: 'Notificaciones',
            activeIcon: Icon(
              FontAwesomeIcons.solidBell,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.user,
            ),
            label: 'Perfil',
            activeIcon: Icon(
              FontAwesomeIcons.solidUser,
            ),
          ),
        ],
      ),
    );
  }
}
