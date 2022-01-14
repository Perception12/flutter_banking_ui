import 'package:flutter/material.dart';
import '../../colors.dart' as color;

class MonthLegend extends StatelessWidget {
  const MonthLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  child: Icon(
                    Icons.arrow_downward_rounded,
                    color: color.AppColor.mainBackground,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    color: color.AppColor.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$ 2090.20",
                  style: TextStyle(
                    color: color.AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Income",
                  style: TextStyle(
                    color: color.AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(width: 40),
            Container(height: 45, width: 1, color: Colors.black),
            const SizedBox(width: 40),
            Column(
              children: [
                Container(
                  child: Icon(
                    Icons.arrow_upward_rounded,
                    color: color.AppColor.mainBackground,
                    size: 30,
                  ),
                  decoration: BoxDecoration(
                    color: color.AppColor.primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$ 1290",
                  style: TextStyle(
                    color: color.AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Spending",
                  style: TextStyle(
                    color: color.AppColor.primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
