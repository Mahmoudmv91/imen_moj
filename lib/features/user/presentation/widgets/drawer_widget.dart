import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imen_moj/config/theme/colors.dart';
import 'package:imen_moj/core/const/assets_utils.dart';
import 'package:imen_moj/core/utils/utils.dart';
import 'package:imen_moj/features/auth/data/models/user_model.dart';

import '../../../../core/utils/transparent_image.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    this.data,
    super.key,
  });

  final UserModel? data;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(15),
      ),
      child: Container(
          color: AColors.backgroundDrawer,
          width: MediaQuery.of(context).size.width * .8,
          child: LayoutBuilder(builder: (BuildContext context, BoxConstraints box) {
            return SafeArea(
              child: Column(
                spacing: 20,
                children: [
                  SizedBox(
                    width: box.maxWidth * .5,
                    height: box.maxWidth * .5,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: FadeInImage(
                            placeholder: MemoryImage(kTransparentImage),
                            image: MemoryImage(const Base64Codec().decode(widget.data!.avatar!)),
                            width: box.maxWidth * .5,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              ImageUtil().saveBase64ToGallery(widget.data!.avatar!);
                            },
                            child: SvgPicture.asset(
                              SvgAssets.ic_user_save_avatar,
                              width: box.maxWidth * .15,
                              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.data?.name ?? '',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: AColors.containerBorderColor,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  SvgAssets.ic_user_exit,
                                  width: box.maxWidth * .08,
                                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcATop),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'خروج از حساب کاربری',
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(
                      color: AColors.containerBorderColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ورژن 1.0.0',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
