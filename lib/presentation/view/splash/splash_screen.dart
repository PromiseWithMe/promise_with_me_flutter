import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promise_with_me_flutter/core/bloc/bloc_state.dart';
import 'package:promise_with_me_flutter/core/componant/image_widget.dart';
import 'package:promise_with_me_flutter/core/componant/scaffold_widget.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_color.dart';
import 'package:promise_with_me_flutter/core/design_sys/sys_images.dart';
import 'package:promise_with_me_flutter/core/util/navigators.dart';
import 'package:promise_with_me_flutter/domain/entity/promise/promises_entity.dart';
import 'package:promise_with_me_flutter/presentation/view/on_boarding/on_boarding_screen.dart';

import '../../../data/dto/promise/get_promises_request.dart';
import '../../view_model/promise/promise_bloc.dart';
import '../../view_model/promise/promise_event.dart';
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

    context.read<PromiseBloc>().add(
      GetPromisesEvent(
        getPromisesRequest: GetPromisesRequest(page: 0, dayOfWeek: []),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocListener<PromiseBloc, BlocState<PromisesEntity>>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.loaded,
          listener: (context, _) {
            Navigators.teleporting(context, PageManager());
          },
        ),

        BlocListener<PromiseBloc, BlocState<PromisesEntity>>(
          listenWhen: (_, state) => state.blocState == BlocStateEnum.error,
          listener: (context, _) {
            Navigators.teleporting(context, OnBoardingScreen());
          },
        ),
      ],
      child: ScaffoldWidget(
        backgroundColor: SysColor.green200,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ImageWidget(image: SysImages.logo, color: SysColor.white)],
        ),
      ),
    );
  }
}
