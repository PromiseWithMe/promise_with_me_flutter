import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWidget extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget? body, floatingActionButton, bottomSheet, bottomNavigationBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const ScaffoldWidget({
    super.key,
    this.appbar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.backgroundColor,
    this.padding,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      padding: padding,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Scaffold(
            backgroundColor: backgroundColor,
            appBar: appbar,
            body: body,
            floatingActionButton: floatingActionButton,
            bottomSheet: bottomSheet,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ),
    );
  }
}
