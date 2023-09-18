import 'package:e_booktique/constants/themes.dart';
import 'package:e_booktique/controllers/product_controllers.dart';
import 'package:e_booktique/views/detail_page.dart';
import 'package:e_booktique/widgets/ads_banner_widget.dart';
import 'package:e_booktique/widgets/card_widget.dart';
import 'package:e_booktique/widgets/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productNotifierProvider);
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('E-BOOKTIQUE'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                )),
          )
        ],
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              // Add Banners Section
              const AdsBannersWidget(),
              //Chip Section
              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: const [
                    ChipWidget(chipLabel: 'Todos'),
                    ChipWidget(chipLabel: 'Romance'),
                    ChipWidget(chipLabel: 'Misterio'),
                    ChipWidget(chipLabel: 'Ciencia Ficción'),
                    ChipWidget(chipLabel: 'Historia'),
                  ],
                ),
              ),
              //Hot sales Section
              const Gap(12),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hot Sales', style: AppTheme.kHeadingOne),
                  Text('Ver Todo', style: AppTheme.kSeeAllText),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(4),
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                  padding: const EdgeInsets.all(4),
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(getIndex: index),
                      ),
                    ),
                    child: ProductCardWidget(productIndex: index),
                  ),
                ),
              ),

              // ProductCardWidget(productIndex: index),
              //Features Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Productos Destacados',
                    style: AppTheme.kHeadingOne,
                  ),
                  Text(
                    'Ver Todo',
                    style: AppTheme.kSeeAllText,
                  ),
                ],
              ),

              MasonryGridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                shrinkWrap: true,
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(getIndex: index),
                    ),
                  ),
                  child: SizedBox(
                    height: 250,
                    child: ProductCardWidget(
                      productIndex: index,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
