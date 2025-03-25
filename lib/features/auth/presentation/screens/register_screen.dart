import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imen_moj/core/const/assets_utils.dart';
import 'package:imen_moj/core/helper/theme_provider.dart';
import 'package:imen_moj/core/util/colors.dart';
import 'package:imen_moj/core/util/utils.dart';
import 'package:imen_moj/core/util/utils_widget/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../core/util/transparent_image.dart';
import '../manager/register_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const String routName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterProvider>(
      create: (_) => RegisterProvider(),
      builder: (context, child) {
        return Scaffold(
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Consumer<ThemeProvider>(
                  builder: (_, provider, __) {
                    return provider.selectedThemeMode == ThemeMode.light
                        ? ExtendedImage.asset(
                            ImageAssets.img_bg_pattern,
                            fit: BoxFit.fill,
                          )
                        : Container(
                            color: AColors.background,
                          );
                  },
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 20,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .3,
                          height: MediaQuery.of(context).size.width * .3,
                          child: Consumer<RegisterProvider>(
                            builder: (_, provider, __) {
                              var avatarWith = (MediaQuery.of(context).size.width * .3) * .3;
                              return Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: provider.avatar != null
                                        ? FadeInImage(
                                            placeholder: MemoryImage(kTransparentImage),
                                            image: MemoryImage(const Base64Codec().decode(provider.avatar!)),
                                            fit: BoxFit.cover,
                                          )
                                        : ExtendedImage.asset(ImageAssets.img_user_avatar_placeholder, fit: BoxFit.fill),
                                  ),
                                  Positioned(
                                    top: -10,
                                    right: -10,
                                    child: provider.avatar != null
                                        ? GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () => provider.resetAvatar(),
                                            child: SvgPicture.asset(
                                              SvgAssets.ic_register_delete_avatar,
                                              width: avatarWith,
                                              height: avatarWith,
                                            ),
                                          )
                                        : GestureDetector(
                                            behavior: HitTestBehavior.opaque,
                                            onTap: () => provider.chooseAvatar(),
                                            child: SvgPicture.asset(
                                              SvgAssets.ic_register_select_avatar,
                                              width: avatarWith,
                                              height: avatarWith,
                                            ),
                                          ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        PTextField(
                          controller: context.read<RegisterProvider>().registerNameController,
                          text: 'نام / نام خانوادگی',
                          hintText: 'لطفا نام و نام خانوادگی خود را وارد نمایید',
                          marginTop: 15,
                        ),
                        PTextField(
                          controller: context.read<RegisterProvider>().registerEmailController,
                          text: 'ایمیل',
                          hintText: 'ایمیل خود را وارد نمایید',
                          marginTop: 15,
                        ),
                        PTextField(
                          controller: context.read<RegisterProvider>().registerPasswordController,
                          obSecure: true,
                          marginTop: 15,
                          hintText: 'پسورد خود را وارد نمایید',
                          text: 'پسورد',
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(7.5),
                          color: AColors.elevatedButton,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(7.5),
                            onTap: () {
                              // context.read<RegisterProvider>().register();
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                              child: Text('عضویت',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AColors.buttonColor),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
