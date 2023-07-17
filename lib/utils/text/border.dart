import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zakario_app_test/utils/helper/helper.dart';

OutlineInputBorder inputBorderPrimary = OutlineInputBorder(
  borderSide: const BorderSide(color: cPrimary, width: 2),
  borderRadius: borderRadius,
);

OutlineInputBorder inputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Color(0xFFE5E5E5), width: 2),
  borderRadius: borderRadius,
);

OutlineInputBorder disabledBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: cTextSecondaryGrey, width: 2),
  borderRadius: borderRadius,
);

BorderRadius borderRadius = BorderRadius.circular(8.r);

InputDecoration inputDecoration(hint, {required bool readOnly}) =>
    InputDecoration(
      filled: true,
      fillColor: readOnly ? cTextSecondaryGrey.withOpacity(.15) : Colors.white,
      errorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: cDanger, width: 2),
      ),
      contentPadding: const EdgeInsets.fromLTRB(14.0, 16.0, 14.0, 16.0),
      // focusedErrorBorder:  inputBorderPrimary,
      hintText: hint,
      focusedErrorBorder: inputBorder.copyWith(
        borderSide: const BorderSide(color: cDanger, width: 2),
      ),
      focusedBorder: readOnly
          ? disabledBorder
          : inputBorder.copyWith(
              borderSide: const BorderSide(color: cPrimary, width: 2)),
      enabledBorder: readOnly ? disabledBorder : inputBorder,
      // isDense: true,
      isCollapsed: true,

      hintStyle: tsHint.copyWith(
        fontSize: 14.sp,
        letterSpacing: .25,
        overflow: TextOverflow.visible,
        fontStyle: FontStyle.italic,
      ),
      border: readOnly ? disabledBorder : inputBorder,
    );
