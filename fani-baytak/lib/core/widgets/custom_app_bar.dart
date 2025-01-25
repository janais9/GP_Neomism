import 'package:flutter/services.dart';
import 'package:neomsim/core/routes/app_router.dart';
import '../assets/assets.gen.dart';
import '../routes/common_import.dart';
import 'horizontal_sized_box.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.titleColor,
    this.needBack = false,
    this.isHigher = false,
    this.suffix,
    this.prefix,
    this.topTitle,
    this.centerTitle = true,
    this.needElevation = false,
    this.needDrawer = false,
    this.needNotification = false,
  });

  final String title;
  final String? topTitle;
  final Color? backgroundColor, titleColor;
  final bool needBack, needNotification;
  final bool isHigher, centerTitle, needElevation, needDrawer;
  final Widget? prefix, suffix;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(isHigher ? 135.h : 115.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: widget.backgroundColor ?? AppColors.scaffoldColor,
      statusBarIconBrightness: Brightness.light,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(
        widget.isHigher ? 135.h : 115.h,
      ),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 25.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.scaffoldColor,
            boxShadow: widget.needElevation
                ? const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 10,
                    ),
                  ]
                : [],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Row(
              children: [
                if (widget.needBack)
                  BackButton(
                    color: context.primaryColor,
                  )
                else if (widget.needDrawer)
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Assets.images.drawer.svg(color: context.primaryColor),
                    ),
                  ),
                if (widget.prefix != null) ...[
                  widget.prefix!,
                ],
                if (!widget.centerTitle) const HorizontalSizedBox(16),
                if (widget.centerTitle) const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.topTitle != null)
                      Text(
                        widget.topTitle ?? '',
                        style: context.greyText,
                      ),
                    Text(
                      widget.title,
                      style: context.mainTitle!.copyWith(
                          color: widget.titleColor ?? context.primaryColor),
                    ),
                  ],
                ),
                const Spacer(),
                if (widget.suffix != null) ...[
                  widget.suffix!,
                  const HorizontalSizedBox(10),
                ],
                if (widget.needNotification)
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.notification),
                    child: CircleAvatar(
                      radius: 15.r,
                      backgroundColor: context.primaryColor,
                      child: Assets.images.notification.svg(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
