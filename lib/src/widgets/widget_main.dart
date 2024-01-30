import 'dart:async';

import 'package:coachmaker/coachmaker.dart';
import 'package:coachmaker/src/widgets/widget_card.dart';
import 'package:flutter/material.dart';

class WidgetMain extends StatefulWidget {
  final double x, y, h, w, padding, borderRadius;
  final CoachModel model;
  final CoachButtonOptions? buttonOptions;
  final Duration duration;
  final Decoration? decoration;
  final EdgeInsets? contentPadding;
  final Widget? closeIcon;
  final TextStyle? nextTextStyle;
  final TextStyle? stepsTextStyle;
  final String steps;
  final bool showSteps;
  final Color? borderColor;

  final Function()? onSkip;
  final Function()? onTapNext;

  final Widget Function(Function? onSkip, Function onNext)? customNavigator;

  const WidgetMain({
    Key? key,
    required this.x,
    required this.y,
    required this.h,
    required this.w,
    required this.duration,
    required this.model,
    this.nextTextStyle,
    this.stepsTextStyle,
    this.steps = '',
    this.showSteps = true,
    this.closeIcon,
    this.padding = 8,
    this.contentPadding,
    this.borderRadius = 5,
    this.decoration,
    this.onSkip,
    this.onTapNext,
    this.borderColor,
    this.buttonOptions,
    this.customNavigator,
  }) : super(key: key);

  @override
  _WidgetMainState createState() => _WidgetMainState();
}

class _WidgetMainState extends State<WidgetMain> {
  ///flag for show card
  ///
  bool enable = false;

  ///height
  ///
  double h = 0;

  ///width
  ///
  double w = 0;

  ///horizontal
  ///
  double x = 0;

  ///vertical
  ///
  double y = 0;

  ///timer for animation hole overlay
  ///
  Timer? timer;

  ///init state
  ///
  @override
  void initState() {
    super.initState();
    start();
  }

  ///dispose
  ///
  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  ///start method (animation, show, etc)
  ///
  void start() async {
    ///await 1 miliseconds
    ///
    await Future.delayed(Duration(milliseconds: 100));

    ///set default value
    ///
    setState(() {
      h = widget.h + (widget.padding * 2);
      w = widget.w + (widget.padding * 2);
      x = widget.x - widget.padding;
      y = widget.y - widget.padding;
    });

    ///set variables with timer
    ///
    timer = Timer.periodic(widget.duration, (Timer t) {
      setState(() {
        h = (h == widget.h + (widget.padding * 2))
            ? widget.h - (widget.padding)
            : widget.h + (widget.padding * 2);
        w = (w == widget.w + (widget.padding * 2))
            ? widget.w - (widget.padding)
            : widget.w + (widget.padding * 2);
        x = (x == widget.x - widget.padding)
            ? widget.x + (widget.padding / 2)
            : widget.x - widget.padding;
        y = (y == widget.y - widget.padding)
            ? widget.y + (widget.padding / 2)
            : widget.y - widget.padding;
      });
    });

    ///await 1 miliseconds
    ///
    await Future.delayed(widget.duration);

    ///show card
    ///
    setState(() {
      enable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedPositioned(
          left: x,
          top: y,
          height: h == 0 ? MediaQuery.of(context).size.height : h,
          width: w == 0 ? MediaQuery.of(context).size.width : w,
          duration: widget.duration,
          curve: Curves.fastEaseInToSlowEaseOut,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.borderColor ?? Colors.green,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(
                widget.borderRadius,
              ),
              // color: Colors.green,
            ),
          ),
        ),
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.8),
            BlendMode.srcOut,
          ),
          child: Container(
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () {
                    // removeOverlay();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      backgroundBlendMode: BlendMode.dstOut,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: x,
                  top: y,
                  height: h == 0 ? MediaQuery.of(context).size.height : h,
                  width: w == 0 ? MediaQuery.of(context).size.width : w,
                  duration: widget.duration,
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: Container(
                    height: h == 0 ? MediaQuery.of(context).size.height : h - 5,
                    width: w == 0 ? MediaQuery.of(context).size.width : w - 5,
                    // padding: EdgeInsets.all(20),
                    // margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Colors.green,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(
                        widget.borderRadius,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        WidgetCard(
          duration: widget.duration,
          x: x,
          y: y,
          h: h,
          w: w,
          enable: enable,
          model: widget.model,
          closeIcon: widget.closeIcon,
          steps: widget.steps,
          showSteps: widget.showSteps,
          nextTextStyle: widget.nextTextStyle,
          stepsTextStyle: widget.stepsTextStyle,
          decoration: widget.decoration,
          contentPadding: widget.contentPadding,
          buttonOptions: widget.buttonOptions,
          onSkip: widget.onSkip,
          customNavigator: widget.customNavigator,
          onTapNext: () async {
            if (enable) {
              setState(() {
                enable = false;
              });
              timer!.cancel();
              setState(() {
                h = MediaQuery.of(context).size.height;
                w = MediaQuery.of(context).size.width;
                x = 0;
                y = 0;
              });
              await Future.delayed(widget.duration);

              widget.onTapNext!();
            }
          },
        )
      ],
    );
  }
}
