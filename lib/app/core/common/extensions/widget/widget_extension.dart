import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tictactoe/app/core/common/constants/app_colors.dart';

extension Expanding on Widget {
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  Widget expandedH({int flex = 1}) => Row(children: [Expanded(flex: flex, child: this)]);
}

extension Heroic on Widget {
  Widget hero(String? tag) => tag != null
      ? Hero(
          tag: tag,
          child: this,
        )
      : this;
}

extension Shimmer on Widget {
  Widget shim() => animate(onPlay: (controller) => controller.repeat()).shimmer(duration: 3.seconds, color: AppColors.grey_100);
}

extension Paddings on Widget {
  Widget p(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
  Widget pV(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );
  Widget pH(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );
  Widget pVH(double paddingV, double paddingH) => Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        child: this,
      );
  Widget pTop(double padding) => Padding(
        padding: EdgeInsets.only(top: padding),
        child: this,
      );
  Widget pLeft(double padding) => Padding(
        padding: EdgeInsets.only(left: padding),
        child: this,
      );
  Widget pRight(double padding) => Padding(
        padding: EdgeInsets.only(right: padding),
        child: this,
      );
  Widget pBottom(double padding) => Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: this,
      );
}

extension SliverPaddings on Widget {
  Widget sliverP(double padding) => SliverPadding(
        padding: EdgeInsets.all(padding),
        sliver: this,
      );
  Widget sliverPV(double padding) => SliverPadding(
        padding: EdgeInsets.symmetric(vertical: padding),
        sliver: this,
      );
  Widget sliverPH(double padding) => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        sliver: this,
      );
  Widget sliverPVH(double paddingV, double paddingH) => SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: paddingH, vertical: paddingV),
        sliver: this,
      );
  Widget sliverPTop(double padding) => SliverPadding(
        padding: EdgeInsets.only(top: padding),
        sliver: this,
      );
  Widget sliverPLeft(double padding) => SliverPadding(
        padding: EdgeInsets.only(left: padding),
        sliver: this,
      );
  Widget sliverPRight(double padding) => SliverPadding(
        padding: EdgeInsets.only(right: padding),
        sliver: this,
      );
  Widget sliverPBottom(double padding) => SliverPadding(
        padding: EdgeInsets.only(bottom: padding),
        sliver: this,
      );
}

extension BasicAnimations on Widget {
  Widget slideFade(bool toTop, {Duration? duration, double? fadeInit, double range = 0.2}) => animate()
      .fade(
        begin: fadeInit ?? 0.2,
        end: 1,
        duration: duration ?? 300.ms,
      )
      .slideY(
        begin: toTop ? range : -range,
        end: 0,
        duration: duration ?? 300.ms,
      );
}
