import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/views/components/custom_container.dart';

class CustomIcon extends StatelessWidget {
  IconData iconData;
  Function? onTap;
  CustomIcon({required this.iconData, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    double size = Config.searchSectionHeight;
    return CustomContainer(
      borderRadius: 6,
      height: size,
      width: size,
      onTap: onTap,
      backgroundColor: Config.primaryColor.withOpacity(0.09),
      child: Icon(
        iconData,
        color: Config.primaryColor,
        size: size - 15,
      ),
    );
  }
}
