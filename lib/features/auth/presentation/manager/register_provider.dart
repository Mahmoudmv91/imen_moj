import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imen_moj/core/const/assets_utils.dart';
import 'package:imen_moj/core/params/create_user_params.dart';
import 'package:imen_moj/core/domain/use_cases/create_user_use_case.dart';
import 'package:imen_moj/core/utils/loading_provider.dart';
import 'package:imen_moj/core/utils/validate/validate_fields.dart';
import 'package:imen_moj/core/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper/data_state.dart';
import '../../../../core/helper/locator.dart';
import '../../../../core/utils/utils.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    super.dispose();
  }

  String? _avatar;

  String? get avatar => _avatar;

  GlobalKey<FormState> get formKey => _formKey;

  String? validateEmail(String email) {
    return ValidateFields.validateEmail(email);
  }

  String? validatePassword(String password) {
    return ValidateFields.validatePassword(password);
  }

  String? validateName(String fullName) {
    return ValidateFields.validateFullName(fullName);
  }

  Future<String> getDefaultAvatar() async {
    return await ImageUtil().convertAssetToBase64(ImageAssets.img_user_avatar_placeholder);
  }

  Future<void> register(BuildContext context) async {
    String defaultAvatar = await getDefaultAvatar();
    final loading = context.read<LoadingProvider>();
    loading.showLoading();
    CreateUserParams registerParams = CreateUserParams(
      fullName: registerNameController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
      userAvatar: avatar ?? defaultAvatar,
    );
    CreateUserUseCase createUserRequest = locator();
    var response = await createUserRequest(registerParams);
    loading.hideLoading();
    if (response is DataSuccess) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.scale,
        title: 'اکانت شما با موفقیت ساخته شد',
        desc: 'می توانید با استفاده از دکمه ورود به اکانت خود دسترسی داشته باشید',
        btnOkText: 'متوجه شدم',
        btnOk: CustomButton(
          title: 'متوجه شدم',
          onTap: () {
            context.pop();
          },
        ),
        btnOkOnPress: () {},
      )..show();
    }
    if (response is DataFailed) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'خطا',
        desc: response.errorMessage.toString(),
        btnOkText: 'متوجه شدم',
        btnOk: CustomButton(
          title: 'متوجه شدم',
          onTap: () {
            context.pop();
          },
        ),
        btnOkOnPress: () {},
      )..show();
      log(response.errorMessage.toString());
    }

    notifyListeners();
  }

  Future<void> chooseAvatar() async {
    final data = await ImageUtil().takeImage(ImageSource.gallery);
    if (data != null) {
      _avatar = data;
      notifyListeners();
    }
  }

  void resetAvatar() {
    _avatar = null;
    notifyListeners();
  }
}
