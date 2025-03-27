class ValidateUseCase {
  static String? validateEmail(String email) {
    if (email.isEmpty) return 'لطفا ایمیل خود را وارد نمایید';
    const pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(email) ? null : 'ایمیل وارد شده نامعتبر است';
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return 'لطفا پسورد را وارد نمایید';
    if (password.length < 8) return 'پسورد باید جداقل 8 کاراکتر باشد';
    const pattern = r'^[a-zA-Z0-9]+$';
    final regex = RegExp(pattern);
    return regex.hasMatch(password) ? null : 'لطفا در پسورد خود فقط از اعداد و حروف انگلیسی استفاده نمایید';
  }
}
