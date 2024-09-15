import 'package:fast8_techtest/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMenuButton extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final String label;
  final bool isNew;
  const HomeMenuButton({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.label,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Badge(
          isLabelVisible: isNew,
          label: Text(
            "New",
            style: body.copyWith(fontSize: 9),
          ),
          child: SvgPicture.asset(
            iconPath,
            height: 28,
            colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: 74,
          child: Text(
            label,
            style: body,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
