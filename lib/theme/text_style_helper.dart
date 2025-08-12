import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  // Headline Styles
  // Medium-large text styles for section headers

  TextStyle get headline27Bold => TextStyle(
        fontSize: 27.fSize,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get headline24BoldInter => TextStyle(
        fontSize: 24.fSize,
        fontWeight: FontWeight.w700,
        fontFamily: 'Inter',
        color: appTheme.colorFF2E2E,
      );

  // Title Styles
  // Medium text styles for titles and subtitles

  TextStyle get title22BoldInter => TextStyle(
        fontSize: 22.fSize,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      );

  TextStyle get title20RegularRoboto => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      );

  TextStyle get title20Bold => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.bold,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get title20Bold2 => TextStyle(
        fontSize: 20.fSize,
        fontWeight: FontWeight.w700,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get title18SemiBold => TextStyle(
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get title17SemiBold => TextStyle(
        fontSize: 17.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFF3C6E,
      );

  TextStyle get title16SemiBold => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.colorFF1F29,
      );

  TextStyle get title16SemiBoldInter => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
        color: appTheme.colorFF2E2E,
      );

  TextStyle get title16Regular => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get title16Medium => TextStyle(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF2E2E,
      );

  // Body Styles
  // Standard text styles for body content

  TextStyle get body15SemiBold => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
        color: appTheme.whiteCustom,
      );

  TextStyle get body15RegularInter => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.colorFF7A76,
      );

  TextStyle get body15SemiBoldInter => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w600,
        fontFamily: 'Inter',
        color: appTheme.colorFF4376,
      );

  TextStyle get body15Regular => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF6C66,
      );

  TextStyle get body15MediumInter => TextStyle(
        fontSize: 15.fSize,
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
      );

  TextStyle get body14Regular => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get body14Medium => TextStyle(
        fontSize: 14.fSize,
        fontWeight: FontWeight.w500,
        color: appTheme.colorFF2E2E,
      );

  TextStyle get body14Inter => TextStyle(
        fontSize: 14.fSize,
        fontFamily: 'Inter',
      );

  TextStyle get body13 => TextStyle(
        fontSize: 13.fSize,
        color: appTheme.colorFF6C66,
      );

  TextStyle get body12Regular => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
      );

  TextStyle get body12Medium => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w500,
      );

  TextStyle get body12RegularInter => TextStyle(
        fontSize: 12.fSize,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
        color: appTheme.colorFF9999,
      );

  TextStyle get body12 => TextStyle(
        fontSize: 12.fSize,
        color: appTheme.colorFF9999,
      );

  // Other Styles
  // Miscellaneous text styles without specified font size

  TextStyle get bodyTextMedium => TextStyle(
        fontWeight: FontWeight.w500,
      );

  TextStyle get bodyTextBold => TextStyle(
        fontWeight: FontWeight.w700,
      );
}
