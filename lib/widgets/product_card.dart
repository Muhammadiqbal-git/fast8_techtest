import 'package:fast8_techtest/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String desc;
  final double price;
  final double? discountPercent;
  const ProductCard(
      {super.key,
      required this.imagePath,
      required this.desc,
      required this.price,
      this.discountPercent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60,
          child: Align(
              alignment: Alignment.center,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfs4O8wSu5TJCkxupZ7J87LbGb-suq-iscJQ&s",
                cacheHeight: 160,
                fit: BoxFit.fitWidth,
              )),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          desc,
          style: body,
        ),
        const SizedBox(
          height: 10,
        ),
        discountPercent == null
            ? Text(
                "Rp ${idrFormat(price)}",
                style: body,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rp ${idrFormat(price)}",
                        style: body.copyWith(
                            decoration: TextDecoration.lineThrough),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.discount_outlined,
                        color: Colors.red,
                        size: 14,
                      ),
                      Text(
                        "${discountPercent?.toInt()}% OFF",
                        style: body.copyWith(color: Colors.red),
                      ),
                    ],
                  ),
                  Text(
                    "Rp ${countDiscount(discountPercent ?? 100, price)}",
                    style: body,
                  )
                ],
              ),
      ],
    );
  }

  String countDiscount(double disc, double price) {
    return idrFormat(price - (price * disc / 100));
  }

  String idrFormat(double price) {
    return NumberFormat("#,###").format(price).replaceAll(',', '.');
  }
}
