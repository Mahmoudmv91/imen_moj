import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:imen_moj/core/widgets/custom_button.dart';
import 'package:imen_moj/features/auth/presentation/manager/login_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/assets_utils.dart';
import '../../../../core/helper/theme_provider.dart';
import '../../../../config/theme/colors.dart';
import '../../../../core/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routName = '/LoginScreen';

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider<LoginProvider>(
      create: (_) => LoginProvider(),
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
                          child: ExtendedImage.asset(
                            ImageAssets.img_logo,
                            width: size * .3,
                            height: size * .3,
                            fit: BoxFit.fill,
                            layoutInsets: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          ),
                        ),
                        Form(
                          key: context.read<LoginProvider>().formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 20,
                            children: [
                              PTextField(
                                controller: context.read<LoginProvider>().emailController,
                                text: 'ایمیل',
                                hintText: 'ایمیل خود را وارد نمایید',
                                marginTop: 15,
                                textFunction: (value) => context.read<LoginProvider>().validateEmail(value ?? ''),
                              ),
                              PTextField(
                                controller: context.read<LoginProvider>().passwordController,
                                text: 'پسورد',
                                hintText: 'پسورد خود را وارد نمایید',
                                obSecure: true,
                                marginTop: 15,
                                textFunction: (value) => context.read<LoginProvider>().validatePassword(value ?? ''),
                              ),
                            ],
                          ),
                        ),
                        CustomButton(
                          title: 'ورود',
                          onTap: () {
                            var provider = context.read<LoginProvider>();
                            if (provider.formKey.currentState!.validate()) {
                              debugPrint('valid');
                              provider.login(context);
                            } else {
                              debugPrint('notValid');
                              provider.formKey.currentState?.validate();
                            }
                          },
                        ),
                        Consumer<LoginProvider>(
                          builder: (_, provider, __) {
                            return Column(
                              children: [
                                if (provider.errorMessage != null)
                                  Text(
                                    provider.errorMessage!,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                Text('${provider.user?.uid} +  ${provider.user?.name}  +  ${provider.user?.email}'),
                              ],
                            );
                          },
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
