import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:llms/helpers/config.dart';
import 'package:llms/helpers/helper.dart';
import 'package:llms/views/components/custom_container.dart';

class ItemWidget extends StatelessWidget {
  Map item;
  ItemWidget({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item["onTap"],
      child: getItemContent(context),
    );
  }

  Widget getItemContent(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Config.greyColor, width: 0.4))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getImage(context),
            Helper.getHorizontalSpace(10),
            getContentSection()
          ],
        ));
  }

  Widget getImage(BuildContext context) {
    return CustomContainer(
      width: Helper.getContextFractionalWidth(
          context, item["left_icon_width_fraction"]),
      height: Helper.getContextFractionalWidth(
          context, item["left_icon_width_fraction"]),
      backgroundImage: getBackgroundImage(),
    );
  }

  ImageProvider getBackgroundImage() {
    if (item["left_image_type"] == "asset") {
      return AssetImage(Config.baseImagePath + item["left_image_path"]);
    } else if (item["left_image_type"] == "file") {
      return FileImage(item["left_image_path"]);
    }
    return AssetImage(Config.baseImagePath + item["left_image_path"]);
  }

  Widget getContentSection() {
    return Expanded(
        child: Column(
      children: [getFirstRow(), Helper.getVerticalSpace(5), getSecondRow()],
    ));
  }

  Widget getFirstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [getTopLeftItem(), getTopRightItem()],
    );
  }

  Widget getSecondRow() {
    if (item["mid_left_text_is_half_screen"]) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [getMiddleLeftItem(item["mid_left_text_is_half_screen"])],
          ),
          Column(
            children: [getMiddleRightItem(), getBottomRightItem()],
          )
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            children: [
              getMiddleLeftItem(item["mid_left_text_is_half_screen"]),
              getMiddleRightItem()
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [getBottomLeftItem(), getBottomRightItem()],
          )
        ],
      );
    }

    // Row(
    //   children: [getMiddleLeftItem(), getMiddleRightItem()],
    // );
  }

  Widget getTopLeftItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        getLeftMainText(),
        Helper.getHorizontalSpace(4),
        getLeftSubText()
      ],
    );
  }

  Widget getLeftMainText() {
    return Helper.getText(
        content: item["top_left_text"],
        fontSize: double.parse(item["top_left_font_size"]),
        fontWeight: FontWeight.bold);
  }

  Widget getLeftSubText() {
    return Container(
      child: Helper.getText(content: item["top_left_small_text"], fontSize: 9),
      margin: EdgeInsets.only(bottom: 3),
    );
  }

  Widget getTopRightItem() {
    return Helper.getText(
        content: item["top_right_text"], fontSize: 11, color: Config.greyColor);
  }

  Widget getMiddleLeftItem(bool halfed) {
    if (halfed) {
      return Container(
          width: 160,
          child: Helper.getText(content: item["mid_left_text"], fontSize: 12));
    } else {
      return Helper.getText(content: item["mid_left_text"], fontSize: 12);
    }
  }

  Widget getMiddleRightItem() {
    return Container();
  }

  Widget getBottomLeftItem() {
    return Helper.getText(
        content: item["bottom_left_text"],
        color: Config.greyColor,
        fontSize: 10.5);
  }

  Widget getBottomRightItem() {
    if (item["bottom_right_type"] == "highlighted") {
      return getHighlightedItem();
    } else {
      return getTextItem();
    }
  }

  Widget getHighlightedItem() {
    return CustomContainer(
        backgroundColor: Config.primaryColor.withOpacity(0.09),
        borderRadius: 20,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Helper.getText(
            content: item["bottom_right_text"],
            color: Config.primaryColor,
            fontSize: 12));
  }

  Widget getTextItem() {
    return Helper.getText(
        content: item["bottom_right_text"],
        fontSize: 12,
        color: Config.blackColor);
  }
}
