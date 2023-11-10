import 'package:flutter/material.dart';
import 'package:moviesapp/screens/browser/browser_page.dart';
import 'package:moviesapp/screens/favorite/favourat_page.dart';
import 'package:moviesapp/screens/home/home.dart';
import 'package:moviesapp/screens/search/search_page.dart';
import 'package:moviesapp/shared/style/colors/app_colores.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> pages = const [
    Home(),
    SearchView(),
    BrowserPage(),
    FavouritPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(child: pages[index]),
        backgroundColor: AppColors.bgColor,
        bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 20,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: AppColors.bottomNavigationBarbacKGroundColor,
                icon: Icon(Icons.home_sharp),
                label: 'HOME',
              ),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.bottomNavigationBarbacKGroundColor,
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'SEARCH'),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'BROWSE',
                backgroundColor: AppColors.bottomNavigationBarbacKGroundColor,
              ),
              BottomNavigationBarItem(
                  backgroundColor: AppColors.bottomNavigationBarbacKGroundColor,
                  icon: ImageIcon(
                    AssetImage(
                      'assets/images/watchlist_icon.png',
                    ),
                  ),
                  label: 'FAVORITE'),
            ]),
      ),
    );
  }
}
