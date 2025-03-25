import 'package:flutter/material.dart';

class AColors {
  static Color? accent = const Color(0x00000000);
  static Color background = Colors.grey.shade200;
  static Color foregroundDrawer = const Color(0x00000000);
  static Color backgroundDrawer = const Color(0x00000000);
  static Color bottomDashboardBackground = const Color(0xff0c0e13);
  static Color foreground = const Color(0x00000000);
  static Color buttonColor = const Color(0xffffffff);
  static Color foregroundCard = const Color(0x00000000);
  static Color bottomSheetColor = const Color(0xfff8f6f8);
  static Color organizationalColor = AColors.organizationalColor;
  static Color insideCircleContainer = const Color(0xffffffff);
  static Color outsideCircleContainer = Colors.transparent;
  static Color boxShadowColor = Colors.transparent;
  static Color borderDashboardItem = const Color(0xffe0dfdf);
  static Color nameOfTheInviteesContainer = const Color(0xffbbc7e0);
  static Color nestedContainers = const Color(0xfff7f7f7);
  static Color plateNoTitleWidgetColor = const Color(0xffffffff);
  static List<Color> backGradientColor = [
    const Color(0xffffccad),
    const Color(0xfffeebdf)
  ];

  static List<Color> borderGradientColor = [
    AColors.organizationalColor,
    const Color(0xffffffff),
  ];

  static Color dropDownBackgroundColor = Colors.white;
  static Color billsTextColor = const Color(0xff595f6b);
  static Color amountContainer = Colors.transparent;
  static Color containerBorderColor = const Color(0xffaeaeae);
  static Color generalItemContainer = const Color(0xFFFFFFFF);

  static Color textFieldBorderColor = const Color(0xffaeaeae);

  static Color dashedLineVerticalPainterColor = const Color(0xffede2e6);
  // static Color? buttonRed;
  // static Color? buttonGreen;
  static Color? elevatedButton = const Color(0xff0c0e13);
  static Color? alertDark;
  static Color? alertDarkBack;
  static Color? alertSuccess;
  static Color? alertSuccessBack;
  static Color? alertDanger;
  static Color? alertDangerBack;
  static Color? alertInfo;
  static Color? alertInfoBack;
  static Color? alertWarning;
  static Color? alertWarningBack;

  static Color? badgeDeepWarning;
  static Color? badgeWarning;
  static Color? badgeSuccess;
  static Color? badgeDanger;
  static Color? badgeInfo;
  static Color? badgeDark;
  static Color? badgeLight;

  static Color? textFieldBackground = const Color(0xffffffff);
  static Color? textFieldLabel;

  static Color? textDefault;
  // static Color text1;

  AColors(ThemeMode mode) {
    if (mode == ThemeMode.light) {
      lightColors();
    } else {
      darkColors();
    }
  }

  void lightColors() {
    // primary = Color(0xFF2CD9A2);
    accent = const Color(0xff12b485);
    background = Colors.grey.shade200;
    foregroundDrawer = const Color(0xff292929);
    backgroundDrawer = const Color(0xff333333);
    bottomDashboardBackground = const Color(0xff0c0e13);
    foreground = const Color(0xff000000);
    buttonColor = const Color(0xffffffff);
    foregroundCard = const Color(0xFFFFFFFF);
    bottomSheetColor = const Color(0xfff8f6f8);
    organizationalColor = const Color(0xffeb5a01);
    insideCircleContainer = const Color(0xffffffff);
    outsideCircleContainer = Colors.transparent;
    boxShadowColor = Colors.transparent;
    borderDashboardItem = const Color(0xffe0dfdf);
    nameOfTheInviteesContainer = const Color(0xffbbc7e0);
    nestedContainers = const Color(0xfff7f7f7);
    plateNoTitleWidgetColor = const Color(0xffffffff);
    backGradientColor = [const Color(0xffffccad), const Color(0xfffeebdf)];
    borderGradientColor = [
      const Color(0xffeb5a01),
      const Color(0xffffffff),
    ];
    dropDownBackgroundColor = Colors.white;
    billsTextColor = const Color(0xff595f6b);
    amountContainer = Colors.transparent;
    containerBorderColor = const Color(0xffaeaeae);
    generalItemContainer = const Color(0xFFFFFFFF);

    textFieldBorderColor = const Color(0xffaeaeae);
    dashedLineVerticalPainterColor = const Color(0xffede2e6);

    // divider = AColors.accent;
    // dividerADrawer = AColors.accent;
    // dividerBDrawer = AColors.backgroundDrawer;
    //
    // buttonGreen = const Color(0xFF73CB5E);
    // buttonRed = const Color(0xFFF92C5A);
    elevatedButton = const Color(0xff0c0e13);
    // alertDark = Colors.black87;
    // alertDarkBack = Colors.black12;
    // alertInfo = Colors.blue;
    // alertInfoBack = Colors.blue[50]!;
    // alertSuccess = Colors.green;
    // alertSuccessBack = Colors.green[50]!;
    // alertDanger = Colors.red;
    // alertDangerBack = Colors.red[50]!;
    // alertWarning = Colors.orangeAccent;
    // alertWarningBack = Colors.orangeAccent.withOpacity(0.1);
    alertDark = Colors.grey[800];
    alertDarkBack = Colors.black12;
    alertInfo = Colors.blue;
    alertInfoBack = Colors.blue.withOpacity(0.2);
    alertSuccess = accent;
    alertSuccessBack = accent!.withOpacity(0.2);
    alertDanger = Colors.redAccent;
    alertDangerBack = Colors.redAccent.withOpacity(0.2);
    alertWarning = Colors.deepOrangeAccent;
    alertWarningBack = Colors.orangeAccent.withOpacity(0.2);

    // dialogBackground = foregroundCard;
    // dialogTextButton = Color(0xFF000000);
    // dialogWarning = Colors.orangeAccent;
    // dialogSuccess = Colors.green;
    // dialogDanger = Colors.red;
    // dialogInfo = Colors.blue;
    //
    badgeDeepWarning = Colors.deepOrangeAccent;
    badgeWarning = Colors.orangeAccent;
    badgeSuccess = const Color(0xFF00BB7E);
    badgeDanger = const Color(0xFFE60457);
    badgeInfo = Colors.blueAccent;
    badgeDark = Colors.grey[800];
    badgeLight = Colors.grey[600]!;
    //
    textFieldBackground = Colors.white;
    textFieldLabel = Colors.grey;
    // //
    // // chartForeground = accent;
    // // chartBackground = Color(0xFFE0E0E0);
    // //
    // // iconFingerprint = accent;
    // //
    textDefault = Colors.black;
    // text1 = Colors.grey[600];
  }

  //#313A55
  void darkColors() {
    // primary = Color(0xFF2CD9A2);
    accent = const Color(0xff12b485);
    background = const Color(0xff0c0e13);
    // background = Color(0xFF062640);
    foregroundDrawer = const Color(0xff292929);
    backgroundDrawer = const Color(0xff333333);
    bottomDashboardBackground = const Color(0xffffffff);

    foreground = const Color(0xffffffff);
    buttonColor = const Color(0xff000000);
    foregroundCard = const Color(0xFF2b3844);
    bottomSheetColor = const Color(0xff0c0e13);
    organizationalColor = const Color(0xffeb5a01);
    insideCircleContainer = const Color(0xff2d3139);
    outsideCircleContainer = const Color(0xff0c0e13);
    boxShadowColor = const Color(0xff000000);
    borderDashboardItem = const Color(0xff474b54);
    nameOfTheInviteesContainer = const Color(0xff2d3139);
    nestedContainers = const Color(0xffaeaeae);
    plateNoTitleWidgetColor = Colors.transparent;

    backGradientColor = [const Color(0xff0c0e13), const Color(0xff2d3139)];
    borderGradientColor = [
      const Color(0xffeb5a01),
      const Color(0xff0c0e13),
    ];
    dropDownBackgroundColor = const Color(0xff0c0e13);
    billsTextColor = Colors.white;

    amountContainer = const Color(0xff1d2026);
    containerBorderColor = const Color(0xff0c0e13);
    generalItemContainer = const Color(0xff1d2026);

    textFieldBorderColor = const Color(0xff595f6b);
    dashedLineVerticalPainterColor = const Color(0xff1d2026);

    // circleContainerBorder=const Color(0xff);
    // 2d3139
    // divider = AColors.accent;
    // dividerADrawer = AColors.accent;
    // dividerBDrawer = AColors.backgroundDrawer;
    //
    elevatedButton = const Color(0xff595f6b);
    // buttonGreen = const Color(0xFF73CB5E);
    // buttonRed = const Color(0xFFF92C5A);

    alertDark = Colors.white;
    alertDarkBack = Colors.black38;
    alertInfo = Colors.white;
    alertInfoBack = Colors.blue;
    alertSuccess = Colors.white;
    alertSuccessBack = accent!;
    alertDanger = Colors.white;
    alertDangerBack = Colors.red;
    alertWarning = Colors.white;
    alertWarningBack = Colors.orange;

    // dialogBackground = foregroundCard;
    // dialogTextButton = Color(0xFFFFFFFF);
    // dialogWarning = Colors.orangeAccent[700]!;
    // dialogSuccess = Colors.green[700]!;
    // dialogDanger = Colors.red[700]!;
    // dialogInfo = Colors.blue[700]!;
    //
    badgeDeepWarning = Colors.deepOrangeAccent;
    badgeWarning = Colors.orangeAccent;
    badgeSuccess = const Color(0xFF00BB7E);
    badgeDanger = const Color(0xFFE60457);
    badgeInfo = Colors.blueAccent;
    badgeDark = Colors.grey[800];
    badgeLight = Colors.grey[600]!;
    //
    textFieldBackground = const Color(0xff12222f);
    textFieldLabel = Colors.white;
    // //
    // // chartForeground = accent;
    // // chartBackground = Color(0xFF232A3B);
    // //
    // // iconFingerprint = Colors.white;
    // //
    textDefault = Colors.white;
    // text1 = Colors.white;
  }
}
