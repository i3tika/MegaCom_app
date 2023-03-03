import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mega_api/core/login_in/widget/container_widget.dart';

import '../../app_images/app_images.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_fonts.dart';

class CodeScreenTwo extends StatelessWidget {
  const CodeScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const [
          Center(
              child: Text(
            'POP',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ))
        ],
      ),
    );
  }
}

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            RotatedBox(
              quarterTurns: 1,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.gradient, AppColors.gradientberz],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                AppImages.ellipseOne,
                width: 215,
                height: 215,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 525, left: 180),
              child: RotatedBox(
                  quarterTurns: 4,
                  child: Image.asset(
                    AppImages.ellipseOne,
                    width: 287,
                    height: 287,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: ContainerWidget(
                widget: Column(
                  children: [
                    const SizedBox(
                      height: 23,
                    ),
                    Text(
                      'Welcome',
                      style: AppFonts.w600s25.copyWith(color: AppColors.white),
                    ),
                    const SizedBox(
                      height: 139,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}