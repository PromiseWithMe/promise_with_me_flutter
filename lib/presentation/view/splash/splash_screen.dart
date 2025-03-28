import 'package:flutter/material.dart';
import 'package:promise_with_me_flutter/core/componant/image_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';

import '../page_manager/page_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      backgroundColor: SysColor.green200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigators.teleporting(context, PageManager());
            },
            child: ImageWidget(image: SysImages.logo, color: SysColor.white),
          ),
        ],
      ),
    );
  }
}
