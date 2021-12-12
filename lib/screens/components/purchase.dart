import 'package:flutter/material.dart';
import '../../colors.dart' as color;

class Purchase extends StatelessWidget {
  final String name;
  final Icon icon;
  final double price;
  const Purchase(
      {Key? key, required this.name, required this.icon, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color.AppColor.greyColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: icon,
          ),
          Column(
            children: [
              Text("\$ $price"),
              Text(name),
            ],
          )
        ],
      ),
    );
  }
}
