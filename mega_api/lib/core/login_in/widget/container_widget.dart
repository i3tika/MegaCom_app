import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';


class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key,
   required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 428,
      height: 565,
      decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.195),
          borderRadius: BorderRadius.circular(40)),
          child: widget,
    );
  }
}
