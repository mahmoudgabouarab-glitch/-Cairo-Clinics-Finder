import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String? hint;
  final Widget? suffix;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? fillcolor;
  final TextStyle? textstyle;
  final TextInputType? keybordtype;
  final bool? readOnly;
  final void Function()? onTap;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormFiled({
    super.key,
    this.hint,
    this.suffix,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.fillcolor,
    this.textstyle,
    this.keybordtype,
    this.readOnly,
    this.onTap,
    this.autovalidateMode,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  late bool _obscure;
  @override
  void initState() {
    _obscure = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      readOnly: widget.readOnly ?? false,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: widget.keybordtype,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        // display counter text when max length is set
        counterText: '',
        prefixIcon: Icon(
          widget.prefixIcon,
          color: AppColor.primary.shade400,
          size: 20.sp,
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        suffixIcon: widget.obscureText
            ? IconButton(
                color: Colors.grey,
                icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => _obscure = !_obscure),
              )
            : widget.suffix,
        fillColor: widget.fillcolor ?? AppColor.cardBg,
        filled: true,
        focusedBorder: _border(AppColor.primary),
        enabledBorder: _border(const Color(0xffEDEDED)),
        errorBorder: _border(AppColor.clinicRed),
        focusedErrorBorder: _border(AppColor.clinicRed),
      ),
      obscureText: _obscure,
      style: widget.textstyle ?? const TextStyle(color: Colors.black),
    );
  }
}

InputBorder? _border(Color color) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color),
    borderRadius: BorderRadius.circular(16),
  );
}
