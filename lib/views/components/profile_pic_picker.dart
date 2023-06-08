import 'dart:io';

import 'package:flutter/material.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/custom_container.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicPicker extends StatelessWidget {
  XFile? pic;
  Function changePic;
  double scale;
  ProfilePicPicker(this.pic, this.changePic, {this.scale = 0.7, super.key});

  @override
  Widget build(BuildContext context) {
    double width = Helper.getContextFractionalWidth(context, 1 / 3);
    return Stack(
      alignment: Alignment.bottomRight,
      children: [getPicWidget(context, width), getEditIcon(width / 5)],
    );
  }

  // Widget getLoadingWidget(BuildContext context, double width) {
  //   return Container(
  //     alignment: Alignment.center,
  //     width: width,
  //     height: width,
  //     child: SpinKitCircle(
  //         color: Theme.of(context).primaryColor,
  //         size: Helper.getContextRatioWidth(context, 0.15)),
  //   );
  // }

  Widget getPicWidget(BuildContext context, double width) {
    Widget picChild;

    if (pic != null) {
      picChild = getChosenImageWidget(width * scale);
    } else {
      picChild = getDefaultPic(width * scale);
    }

    return GestureDetector(
        onTap: () async {
          final ImagePicker picker = ImagePicker();
          final XFile? image =
              await picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            changePic(image);
          }
        },
        child: picChild);
  }

  Widget getEditIcon(side) {
    return CustomContainer(
      width: side,
      height: side,
      backgroundImage: AssetImage("${Config.baseImagePath}/editIcon.png"),
      onTap: () async {
        final ImagePicker picker = ImagePicker();
        final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);
        if (image != null) {
          changePic(image);
        }
      },
    );
  }

  Widget getChosenImageWidget(double width) {
    return CircleAvatar(
      radius: width / 2,
      backgroundImage: FileImage(File(pic!.path)),
    );
  }

  Widget getDefaultPic(double width) {
    return Container(
      width: width,
      height: width,
      decoration: getDefaultPicContainerDecoration(),
    );
  }

  static getDefaultPicContainerDecoration() {
    return BoxDecoration(
        image: DecorationImage(
            image:
                AssetImage("${Config.baseImagePath}/defaultProfilePic.png")));
  }
}
