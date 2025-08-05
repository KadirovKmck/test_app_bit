import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showTrailingButton;
  final bool showArrowBackButton;
  final TextStyle? textStyle;
  final Function()? onTapTrailing;
  final Color? backgroundColor;
  final Color? lidingButtomColor;

  const CustomAppBar({
    super.key,
    this.title,
    this.showTrailingButton = false,
    this.showArrowBackButton = false,
    this.textStyle,
    this.onTapTrailing,
    this.backgroundColor,
    this.lidingButtomColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xff41519C),
      surfaceTintColor: Color(0xff41519C),
      leading: showArrowBackButton
          ? GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 8.w,
                height: 4.h,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            )
          : SizedBox(width: 11.5.w),
      centerTitle: true,
      title: Center(
        child: Text(
          title ?? '',
          style:
              textStyle ??
              TextStyle(
                color: Colors.white,
                fontSize: 23.sp,
                fontFamily: 'Outfit',
                fontWeight: FontWeight.w500,
                height: 1,
              ),
        ),
      ),
      actions: [
        showTrailingButton
            ? GestureDetector(
                onTap: onTapTrailing,
                child: Container(
                  width: 15.w,
                  height: 6.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFEE9B3),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/svg/settings.svg'),
                  ),
                ),
              )
            : SizedBox(width: 11.5.w),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
