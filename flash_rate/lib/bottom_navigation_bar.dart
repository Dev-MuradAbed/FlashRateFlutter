// ignore_for_file: camel_case_types
import 'package:flash_rate/homepage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'booldpreesure.dart';
import 'home.dart';
import 'map/Screens/search.dart';
import 'package:flash_rate/map/services/geolocator_service.dart';
import 'package:provider/provider.dart';

import 'news/screens/home_screen.dart';

class bottomNavigationBar extends StatefulWidget {
  const bottomNavigationBar({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 2;


  final items = [
    const Icon(
      Icons.home,
      size: 30,
    ),
    const Icon(
      Icons.search,
      size: 30,
    ),
    const Icon(
      Icons.favorite,
      size: 30,
    ),
    const Icon(
      Icons.settings,
      size: 30,
    ),
    const Icon(
      Icons.person,
      size: 30,
    ),
  ];
  final screens = [
    /**
     * screen map: that help pepole to find a near hosptail if you want and sent pepole location to hosptal to send amplce to the man. 
     * screen montor: that have three screen 1.blood pre.. 2.rate bpm  3.list of the result of the rate bpm and blood
     * screen news: that show user the new news about health and another thinks
     * screen todo: that can user recive notfication in time maedsin  and time vist doctor that after add detail by hosptail or doctor
     * screen profil:
     */
     HomeNews(),
    Search(),
    HomeRate(),
    HomeBooldPres(),
    const HomePage(),
    // HomePage(),
    // // HomeRate(),
    // HomePage(),
    // HomePage(),
    // HomePage(),
    // HomePage(),
    // HomeRate()
    //  HeartRate(),
    // const HomePage(),
    // const HomePage(),
    // const HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: SafeArea(
        top: true,
        child: ClipRect(
          child: Scaffold(
            backgroundColor: Colors.white,
            extendBody: true,
            body: screens[index],
            bottomNavigationBar: CurvedNavigationBar(
              key: navigationKey,
              backgroundColor: Colors.transparent,
              color: Colors.green,
              height: 60,
              items: items,
              index: index,
              onTap: (index) {
                setState(() => this.index = index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
