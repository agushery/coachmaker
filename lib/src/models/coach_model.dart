import 'package:flutter/material.dart';

class CoachModel {
  CoachModel({
    this.initial,
    this.title,
    this.titleTextStyle,
    this.subtitle,
    this.subtitleTextStyle,
    this.header,
    this.maxWidth,
    this.alignment = Alignment.center,
    this.nextOnTapCallBack,
    this.scrollOptions,
    this.customTop,
    this.customLeft,
  });

  String? initial;
  String? title;
  TextStyle? titleTextStyle;
  List<dynamic>? subtitle;
  TextStyle? subtitleTextStyle;
  Widget? header;
  double? maxWidth;
  AlignmentGeometry? alignment;
  Future<bool> Function()? nextOnTapCallBack;
  ScrollOptions? scrollOptions;
  double Function(double x, double y, double h, double hCard)? customTop;
  double Function(double x, double y, double h, double hCard)? customLeft;
}

class ScrollOptions {
  ScrollOptions(
      {this.scrollController,
      this.manualHeight,
      this.scrollToIndex,
      this.isLast = false});

  double? manualHeight;
  ScrollController? scrollController;
  int? scrollToIndex;
  bool isLast;
}
