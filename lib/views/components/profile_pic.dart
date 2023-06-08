import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:llms/helpers/config.dart';

class ProfilePic extends StatelessWidget {
  String? url;
  double iconWidth;
  String? imagePath;
  Function? onPressed;
  ProfilePic(
      {this.url,
      this.imagePath,
      required this.iconWidth,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider image;
    if ((imagePath == "" || imagePath == null) && isNotValidUrl(url)) {
      image = AssetImage("${Config.baseImagePath}/defaultProfilePic.png");
    } else if (imagePath != null) {
      image = FileImage(File(imagePath!));
    } else {
      image = NetworkImage(url!);
    }
    return InkWell(
        onTap: () {
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: CircleAvatar(
          backgroundColor: Config.whiteColor,
          radius: iconWidth / 2 + 2,
          child: CircleAvatar(
              backgroundColor: Config.whiteColor,
              radius: iconWidth / 2,
              backgroundImage: image),
        ));
  }

  bool isNotValidUrl(String? url) {
    return url == null || url == "";
  }
}
