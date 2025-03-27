import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final Text text;
  final double width, height;
  final double? borderRadius;
  final Color? color, fontColor, loadingIndicatorColor;
  final Widget? leftLeading, rightLeading;
  final GestureTapCallback? onTap;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final bool isLoading;

  const ButtonWidget({
    required this.text,
    required this.width,
    required this.height,
    this.isLoading = false,
    this.loadingIndicatorColor = const Color(0xFF449630),
    this.fontColor,
    this.color,
    this.leftLeading,
    this.rightLeading,
    this.borderRadius,
    this.onTap,
    this.padding,
    this.border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          border: border,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: (width / 3) - 1,
              alignment: AlignmentDirectional.centerStart,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Builder(
                  builder: (context) {
                    if (leftLeading == null) {
                      return const SizedBox.shrink();
                    } else {
                      return leftLeading!;
                    }
                  },
                ),
              ),
            ),
            Container(
              width: width / 3,
              alignment: AlignmentDirectional.center,
              child: Center(
                child: Builder(
                  builder: (_) {
                    if (isLoading) {
                      return CircularProgressIndicator(
                        color: loadingIndicatorColor,
                      );
                    } else {
                      return text;
                    }
                  },
                ),
              ),
            ),
            Container(
              width: (width / 3) - 1,
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Builder(
                  builder: (context) {
                    if (rightLeading == null) {
                      return const SizedBox.shrink();
                    } else {
                      return rightLeading!;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
