part of 'helper.dart';

const Color cBackground = Color(0xFFFFFFFF);
const Color cPrimary = Color(0xFF0146AB);
const Color cSecondary = Color(0xFF55B9E4);

const Color cTextBlack = Color(0xFF4C4F54);
const Color cTextSecondaryBlack = Color(0xFF7F8184);
const Color cTextSecondaryGrey = Color(0xFFB2B3B5);
const Color cTextWhite = Color(0xFFFFFFFF);
const Color cTextLightGray = Color(0xFFE5E5E5);

const Color cSuccess = Color(0xFF44CD90);
const Color cDanger = Color(0xFFFF6E5D);
const Color cYellow = Color(0xFFFFB229);
const Color cGreen = Color(0xFF5FCE36);
const Color cDivider = Color(0xFFF5F5F5);
const Color cBorder = Color(0xFFE5E5E5);
const Color cTeal = Color(0xFF09A0B6);
const Color cLightBlue = Color(0xFF02B4FA);
const Color cLightPurple = Color(0xFF738CE0);
const Color cCardBorder = Color(0xFFE5E5E5);

const Color cSelectedBGChip = Color(0xFFE4F4FB);
const Color cSelectedBorderChip = Color(0xFF2B5D72);

const Color cBackgroundOffWhite = Color(0xFFFCFCFC);
const Color cTable = Color(0xFFE2EAF4);

// Claims Color Status
const Color cSendCard = Color(0xFFBBE3F4);
const Color cAllCard = Color(0xFFFFE0A9);
const Color cApproveCard = Color(0xFFB4EBD2);
const Color cRejectCard = Color(0xFFFFC5BE);
const Color cWarningCard = Color(0xFFFFEFD4);

const Color cSendBorder = Color(0xFF55B9E4);
const Color cAllBorder = Color(0xFFFFB229);
const Color cApproveBorder = Color(0xFF44CD90);
const Color cRejectBorder = Color(0xFFFF6E5D);

// Warning Color
const Color cWarningBorder = Color(0xFFFFE58F);
const Color cWarning = Color(0xFFFFFBE6);

// Font Weight
FontWeight fwThin = FontWeight.w100;
FontWeight fwExtraLight = FontWeight.w200;
FontWeight fwLight = FontWeight.w300;
FontWeight fwNormal = FontWeight.w400;
FontWeight fwMedium = FontWeight.w500;
FontWeight fwSemiBold = FontWeight.w600;
FontWeight fwBold = FontWeight.w700;
FontWeight fwExtraBold = FontWeight.w800;
FontWeight fwBlack = FontWeight.w900;

// Text Style
TextStyle tsTitle = TextStyle(
  color: cTextBlack,
  fontSize: 16.sp,
  fontWeight: FontWeight.w700,
);
TextStyle tsSubtitle = TextStyle(
    // height: 16,
    color: cTextSecondaryBlack,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400);
TextStyle tsLargeTitle =
    TextStyle(color: cTextBlack, fontWeight: fwBold, fontSize: 18.sp);
TextStyle tsBlack = TextStyle(
    color: cTextBlack, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsBlackBold =
    TextStyle(color: cTextBlack, fontSize: 14.sp, fontWeight: fwBold);
TextStyle tsBlackSecondary = TextStyle(
    color: cTextSecondaryBlack, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsGreySecondary = TextStyle(
    color: cTextSecondaryGrey, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsGreyItalicSecondary = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    color: cTextSecondaryBlack);
TextStyle tsPrimary =
    TextStyle(color: cPrimary, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsSecondary = TextStyle(
    color: cSecondary, fontSize: 14.sp, fontWeight: FontWeight.normal);

TextStyle tsWhite = TextStyle(
    color: cTextWhite, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsWhiteTitle =
    TextStyle(color: cTextWhite, fontSize: 30.sp, fontWeight: FontWeight.w400);
TextStyle tsHint = TextStyle(
    color: cTextSecondaryBlack, fontSize: 14.sp, fontWeight: FontWeight.normal);
TextStyle tsDanger = TextStyle(
  color: cDanger,
  fontSize: 14.sp,
  fontWeight: FontWeight.normal,
);
TextStyle tsEcard = TextStyle(
  color: cTextBlack,
  fontSize: 7.sp,
  fontWeight: fwBold,
  fontFamily: 'helvetica neue',
);
TextStyle tsEcardPrimary = TextStyle(
  color: cPrimary,
  fontSize: 6.sp,
  fontWeight: fwMedium,
  fontFamily: 'helvetica neue',
);

TextStyle tsEcardPrimaryItems = TextStyle(
  color: cPrimary,
  fontSize: 5.sp,
  fontWeight: fwLight,
  fontFamily: 'helvetica neue',
);
