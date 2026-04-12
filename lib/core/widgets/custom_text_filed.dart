import 'package:cairo_clinics_finder/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String? hint;
  final Widget? suffix;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? fillcolor;
  final TextStyle? textstyle;
  final Function(String)? onchange;
  final TextInputType? keybordtype;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final void Function()? onTap;

  const CustomTextFormFiled({
    super.key,
    this.hint,
    this.suffix,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.labelText,
    this.labelStyle,
    this.fillcolor,
    this.textstyle,
    this.onchange,
    this.keybordtype,
    this.maxLength,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
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
      inputFormatters: widget.inputFormatters,
      maxLength: widget.maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (_) =>
          widget.onTap ?? FocusManager.instance.primaryFocus?.unfocus(),
      keyboardType: widget.keybordtype,
      onChanged: widget.onchange,
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        // display counter text when max length is set
        counterText: '',
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
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
