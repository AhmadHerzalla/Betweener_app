import 'package:flutter/material.dart';
import 'package:tt9_betweener_challenge/constants.dart';

abstract class Styles {
  static OutlineInputBorder primaryRoundedOutlineInputBorder =
      OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(
      color: kPrimaryColor,
      width: 2,
    ),
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: kPrimaryColor,
  );
}
