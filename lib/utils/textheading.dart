import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/color_constant.dart';

class TextHeading extends StatelessWidget {
  const TextHeading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter V',
        color: ColorConstantsLight.textColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,
      ),
    );
  }
}
