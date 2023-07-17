part of 'buttons.dart';

class ButtonPrimaryRounded extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isEnable;
  //
  const ButtonPrimaryRounded(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.isEnable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        primary:
            onPressed != null && isEnable ? cPrimary : const Color(0xFFB2B3B5),
        fixedSize: Size(double.infinity, 48.h),
        elevation: 0,
      ),
      child: Text(
        title,
        semanticsLabel: title.replaceAll(" ", "-"),
        style: tsWhite.copyWith(fontWeight: fwBold),
      ),
    );
  }
}
