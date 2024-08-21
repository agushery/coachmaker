import 'package:flutter/material.dart';

class CoachButtonOptions {
  CoachButtonOptions({
    this.skipTitle = 'Skip',
    this.buttonTitle = 'Next',
    this.titleLastStep,
    this.buttonStyle = const ButtonStyle(),
  });

  String? skipTitle;
  ButtonStyle? skipStyle;
  String? buttonTitle;
  String? titleLastStep;
  ButtonStyle? buttonStyle;
}
