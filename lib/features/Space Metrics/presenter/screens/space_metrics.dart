import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class SpaceMetrics extends StatelessWidget {
  const SpaceMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          crossAxisAlignment: .center,

          children: [
            Row(
              children: [
                Spacer(),
                Text(
                  "Space Metrics",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: .w500,
                    color: Color.fromARGB(255, 255, 254, 254),
                    fontFamily: FontFamily.audiowide,
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              padding: EdgeInsets.all(3),
              alignment: .center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.blue),
              width: 155,
              height: 40,
              child: TextField(decoration: InputDecoration(icon: Assets.icons.image.image(), hintText: "Weight",border: .none)),
            ),
          ],
        ),
      ),
    );
  }
}
