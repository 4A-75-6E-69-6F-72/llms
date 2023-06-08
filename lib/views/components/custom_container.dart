import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget? child;
  Color? borderColor;
  Color? backgroundColor;
  EdgeInsets? margin;
  EdgeInsets? padding;
  Alignment? alignment;
  double? width;
  double? height;
  ImageProvider? backgroundImage;
  Function? onTap;
  BoxFit? imageFit;
  double borderRadius;

  BorderSide? borderLeft;
  BorderSide? borderRight;
  BorderSide? borderTop;
  BorderSide? borderBottom;
  CustomContainer(
      {this.onTap,
      this.child,
      this.backgroundColor,
      this.margin,
      this.padding,
      this.alignment,
      this.width,
      this.height,
      this.borderColor,
      this.backgroundImage,
      this.borderRight,
      this.borderBottom,
      this.borderLeft,
      this.borderTop,
      this.imageFit,
      this.borderRadius = 0,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (onTap != null) {
      return InkWell(
        child: getCustomContainer(),
        onTap: () {
          onTap!();
        },
      );
    } else {
      return getCustomContainer();
    }
  }

  Widget getCustomContainer() {
    Border? border = getBorder();

    if (border != null && backgroundImage != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: border,
            image: DecorationImage(
              fit: imageFit,
              image: backgroundImage!,
            )),
        child: child,
      );
    } else if (backgroundImage != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            image: DecorationImage(
              image: backgroundImage!,
              fit: imageFit,
            )),
        child: child,
      );
    } else if (border != null && backgroundColor != null) {
      return Container(
          alignment: alignment,
          width: width,
          height: height,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              border: border,
              color: backgroundColor),
          child: child);
    } else if (border != null) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            border: border),
        child: child,
      );
    } else {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: backgroundColor,
        ),
        child: child,
      );
    }
  }

  Border? getBorder() {
    if (borderLeft != null ||
        borderRight != null ||
        borderBottom != null ||
        borderTop != null) {
      return Border(
          bottom: borderBottom ?? BorderSide.none,
          left: borderLeft ?? BorderSide.none,
          right: borderRight ?? BorderSide.none,
          top: borderTop ?? BorderSide.none);
    } else if (borderColor != null) {
      return Border.all(color: borderColor!);
    } else {
      return null;
    }
  }
}
