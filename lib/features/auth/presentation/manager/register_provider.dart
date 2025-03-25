import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/data_state.dart';
import '../../../../core/helper/locator.dart';
import '../../../../core/util/utils.dart';
import '../../data/params/register_params.dart';
import '../../domain/use_cases/register_use_case.dart';

class RegisterProvider extends ChangeNotifier {
  final TextEditingController registerNameController = TextEditingController();
  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController = TextEditingController();

  @override
  void dispose() {
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    super.dispose();
  }

  String? _avatar;

  String? get avatar => _avatar;

  Future<void> register() async {
    RegisterParams registerParams = RegisterParams(
      fullName: registerNameController.text,
      email: registerEmailController.text,
      password: registerPasswordController.text,
      userAvatar: avatar,
    );
    RegisterUseCase registerRequest = locator();
    var response = await registerRequest(registerParams);
    if (response is DataSuccess) {
      log('success');
    }
    if (response is DataFailed) {
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
