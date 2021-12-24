import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WidgetRate extends StatelessWidget {
  final Color? color;
  final Color? colorSvg;
  final String? jobtext;
  final String? jobdescrb;
  final String? imgSVG;
  const WidgetRate({
    Key? key,
    this.color,
    this.jobtext,
    this.jobdescrb,
    this.imgSVG,
    this.colorSvg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 360,
          color: Colors.white12,
          padding: const EdgeInsets.only(top: 33),
          child: Container(
            height: 200,
            width: 180,
            color: Colors.grey.shade50,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 200,
                    // color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, top: 110),
                      child: Text(
                        jobtext!,
                        style: const TextStyle(fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(jobdescrb!),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 200,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(child: Text("Get This Service")),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10, left: 15),
          child: SvgPicture.asset(
            imgSVG!,
            color: colorSvg,
            height: 120,
          ),
        ),
      ],
    );
  }
}
