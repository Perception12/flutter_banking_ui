import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../colors.dart' as color;

final formatCurrency = NumberFormat.simpleCurrency();

class Purchase extends StatelessWidget {
  final String name;
  final Icon icon;
  final double price;
  const Purchase({
    Key? key,
    required this.name,
    required this.icon,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width / 2 - 60,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4 - 35,
            height: MediaQuery.of(context).size.width / 4 - 35,
            decoration: BoxDecoration(
              color: color.AppColor.greyColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: icon,
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(formatCurrency.format(price),
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                  color: color.AppColor.greyColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
