import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/utils/color_constant.dart';

class InputFieldSignUp extends StatelessWidget {
  InputFieldSignUp({
    Key? key,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.controller,
    this.enable = false,
    this.data,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.maxLength = 100,
  }) : super(key: key);
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final String? data;
  final bool enable;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      readOnly: enable,
      obscureText: obscureText,
      cursorColor: ColorConstantsLight.textColor,
      style: TextStyle(
        fontFamily: 'Inter V',
        color: ColorConstantsLight.textColor,
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      textCapitalization: textCapitalization,
      validator: (value) {
        if (value!.length == 0) {
          return "Please enter $data";
        }
        if (data == "email") {
          String pattern =
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
              r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
              r"{0,253}[a-zA-Z0-9])?)*$";
          // r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Please enter valid email';
          }
        }
        if (data == 'number') {
          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
          RegExp regExp = new RegExp(pattern);
          if (value.length < 10 || !regExp.hasMatch(value)) {
            return "Please enter valid $data";
          }
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          fontFamily: 'Inter V',
          color: ColorConstantsLight.textColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        counterText: "",
        prefixIcon: prefix,
        filled: true,
        fillColor: Colors.white,
        suffix: suffix,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorConstantsLight.borderColor,
          ),
        ),
        border: InputBorder.none,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            width: 1,
            color: ColorConstantsLight.borderColor,
          ),
        ),
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        hintStyle: TextStyle(
          fontFamily: 'Inter V',
          color: ColorConstantsLight.hinttextColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
