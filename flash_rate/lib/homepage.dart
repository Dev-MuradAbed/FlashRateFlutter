import 'dart:ui';
import 'package:flutter/material.dart';

import 'widgets/bordercolorstyle.dart';
import 'widgets/cardratehealto2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UnicornOutlineButton(
                      strokeWidth: 3,
                      radius: 10,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.green,
                            Colors.green.withOpacity(.7),
                            Colors.green.withOpacity(.5),
                            Colors.green.withOpacity(.2),
                            Colors.green.withOpacity(0),
                          ]),
                      child: Icon(
                        Icons.category_outlined,
                        size: 30,
                        color: Colors.green.withOpacity(.8),
                      ),
                      onPressed: () {},
                    ),
                    UnicornOutlineButton(
                      minHeight: 100,
                      minWidth: 100,
                      strokeWidth: 5,
                      radius: 10,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.green,
                            Colors.green.withOpacity(.7),
                            Colors.green.withOpacity(.5),
                            Colors.green.withOpacity(.2),
                            Colors.green.withOpacity(0),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/93073520?s=400&u=8b466ff9fe1b27a7d4ff441f84b2289484422a76&v=4',
                          fit: BoxFit.cover,
                          height: 94,
                          width: 94,
                        ),
                      ),
                      onPressed: () {},
                    ),
                    UnicornOutlineButton(
                      strokeWidth: 3,
                      radius: 10,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.green,
                            Colors.green.withOpacity(.7),
                            Colors.green.withOpacity(.5),
                            Colors.green.withOpacity(.2),
                            Colors.green.withOpacity(0),
                          ]),
                      child: Icon(
                        Icons.settings_outlined,
                        size: 30,
                        color: Colors.green.withOpacity(.8),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Murad Abed',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900),
                ),
                const Text(
                  'Hope you are fine',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    WidgetRate(
                      color: Colors.green,
                      imgSVG: 'assets/svg/o2-logo-svg-vector.svg',
                      jobdescrb:
                          "Hey evre boby if you want cahck your rat heart use this service",
                      jobtext: "Rate heart",
                      colorSvg: Colors.greenAccent,
                    ),
                    WidgetRate(
                      color: Colors.green,
                      imgSVG:
                          'assets/svg/heartbeat-heart-health-pulse-smartphone-medical-rate-svgrepo-com.svg',
                      jobdescrb:
                          "Hey evre boby if you want cahck your rat heart use this service",
                      jobtext: "Rate heart",
                      colorSvg: Colors.greenAccent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
