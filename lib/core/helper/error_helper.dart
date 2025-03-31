import 'package:firebase_auth/firebase_auth.dart';

String handleFirebaseAuthException(FirebaseAuthException e) {
  switch (e.code) {
    case "invalid-email":
      return "ایمیل وارد شده نامعتبر است.";
    case "user-disabled":
      return "حساب کاربری شما غیرفعال شده است.";
    case "user-not-found":
      return "کاربری با این ایمیل یافت نشد.";
    case "invalid-credential":
      return "رمز عبور نادرست است.";
    case "email-already-in-use":
      return "کاربری با این مشخصات وجود دارد";
    default:
      return "ورود ناموفق. لطفا بعدا تلاش نمایید.";
  }
}