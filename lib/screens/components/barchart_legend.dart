import 'package:flutter/material.dart';
import '../../colors.dart' as color;

class BarChartLegend extends StatelessWidget {
  const BarChartLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color.AppColor.greyColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("Incoming"),
                ],
              ),
            ),
            const SizedBox(width: 25),
            SizedBox(
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: color.AppColor.primaryColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Text("Spend"),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
    ]);
  }
}
