// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/color_constant.dart';

class Smallheading extends StatelessWidget {
  const Smallheading({
    Key? key,
    required this.headingText,
    // required String text,
  }) : super(key: key);
  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        fontFamily: 'Inter V',

        color: ColorConstantsLight.whiteColor,
        // color: const Color(0xff127781),
        fontWeight: FontWeight.w500,
        fontSize: 17.sp,
      ),
    );
  }
}
