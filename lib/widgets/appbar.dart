import 'package:flutter/material.dart';
import 'package:recipeapp_animation/constants/colors.dart';
import 'package:recipeapp_animation/util/screen_util.dart';
import 'package:recipeapp_animation/util/text_util.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({super.key});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.arrow_back_ios_outlined, size: 40, color: whiteColor),
            Spacer(),
            Container(
              height: context.height(0.043),
              width: context.width(0.14),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(
                Icons.video_camera_back_outlined,
                color: const Color.fromARGB(255, 241, 203, 31),
                size: 30,
              ),
            ),
            SizedBox(width: 8),
            Container(
              height: context.height(0.043),
              width: context.width(0.25),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  "EASY",
                  style: AppTextStyles.jayabaru.copyWith(
                    fontSize: context.responsiveFont(16),
                    color: const Color.fromARGB(255, 241, 203, 31),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
