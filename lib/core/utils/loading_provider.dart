import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingProvider with ChangeNotifier{


  void showLoading(){
    EasyLoading.show(
      status: 'لطفا چند لحظه منتظر بمانید',
      maskType: EasyLoadingMaskType.black,
    );
  }
  void hideLoading(){
    EasyLoading.dismiss();
  }
}