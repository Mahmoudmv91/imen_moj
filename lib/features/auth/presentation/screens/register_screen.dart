import 'dart:convert';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imen_moj/core/const/assets_utils.dart';
import 'package:imen_moj/core/helper/theme_provider.dart';
import 'package:imen_moj/config/theme/colors.dart';
import 'package:imen_moj/core/widgets/custom_button.dart';
import 'package:imen_moj/features/auth/presentation/screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/transparent_image.dart';
import '../../../../core/widgets/custom_textfield.dart';
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
    double size = MediaQuery.of(context).size.width * .3;
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
                  child: SingleChildScrollView(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 20,
                          children: [
                            SizedBox(
                              width: size,
                              height: size,
                              child: Consumer<RegisterProvider>(
                                builder: (_, provider, __) {
                                  var avatarWith = size * .3;
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
                                                  colorFilter: ColorFilter.mode(AColors.foreground, BlendMode.srcATop),
                                                  width: avatarWith,
                                                  height: avatarWith,
                                                ),
                                              )
                                            : GestureDetector(
                                                behavior: HitTestBehavior.opaque,
                                                onTap: () => provider.chooseAvatar(),
                                                child: SvgPicture.asset(
                                                  SvgAssets.ic_register_select_avatar,
                                                  colorFilter: ColorFilter.mode(AColors.foreground, BlendMode.srcATop),
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
                            Form(
                              key: context.read<RegisterProvider>().formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 20,
                                children: [
                                  PTextField(
                                    controller: context.read<RegisterProvider>().registerNameController,
                                    text: 'نام / نام خانوادگی',
                                    hintText: 'لطفا نام و نام خانوادگی خود را وارد نمایید',
                                    marginTop: 15,
                                    textFunction: (value) => context.read<RegisterProvider>().validateName(value ?? ''),
                                  ),
                                  PTextField(
                                    controller: context.read<RegisterProvider>().registerEmailController,
                                    text: 'ایمیل',
                                    hintText: 'ایمیل خود را وارد نمایید',
                                    marginTop: 15,
                                    textFunction: (value) => context.read<RegisterProvider>().validateEmail(value ?? ''),
                                  ),
                                  PTextField(
                                    controller: context.read<RegisterProvider>().registerPasswordController,
                                    obSecure: true,
                                    marginTop: 15,
                                    hintText: 'پسورد خود را وارد نمایید',
                                    text: 'پسورد',
                                    textFunction: (value) => context.read<RegisterProvider>().validatePassword(value ?? ''),
                                  ),
                                ],
                              ),
                            ),
                            CustomButton(
                              title: 'عضویت',
                              onTap: () {
                                var provider = context.read<RegisterProvider>();
                                if (provider.formKey.currentState?.validate() ?? false) {
                                  provider.register(context);
                                } else {
                                  provider.formKey.currentState?.validate();
                                }
                              },
                            ),
                            CustomButton(
                              title: 'ورود',
                              onTap: () {
                                context.push(LoginScreen.routName);
                              },
                            ),
                          ],
                        ),
                      ),
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
