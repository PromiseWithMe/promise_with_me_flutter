import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyScaffold extends StatelessWidget {
  final PreferredSizeWidget? appbar;
  final Widget? body, floatingActionButton, bottomSheet;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  const MyScaffold({
    super.key,
    this.appbar,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
          ),
        ),
      ),
    );
  }
}