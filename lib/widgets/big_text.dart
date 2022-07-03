import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app_front/utils/colors.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.size = 20,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 1,
        overflow: overflow,
        style: TextStyle(
            color: color,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: size));
  }
}
