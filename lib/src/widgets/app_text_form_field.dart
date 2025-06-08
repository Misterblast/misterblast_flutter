import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.obsecure = false,
    this.label,
    this.hintText,
    this.validator,
    this.focusNode,
    this.prefixIcon,
    this.textStyle,
    this.textPadding,
    this.maxLines,
  });

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool obsecure;
  final String? label;
  final String? hintText;
  final String? Function(String)? validator;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? textPadding;
  final int? maxLines;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obsecure;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(
            widget.label!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        TextFormField(
          maxLines: widget.maxLines ?? 1,
          focusNode: widget.focusNode,
          keyboardType: widget.obsecure
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          controller: widget.controller,
          obscureText: widget.obsecure ? _isObscured : false,
          validator: (value) {
            if (widget.validator != null) {
              return widget.validator!(value!);
            }
            return null;
          },
          style: widget.textStyle ?? Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            contentPadding: widget.textPadding ??
                const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 44,
              minHeight: 24,
            ),
            suffixIcon: widget.obsecure
                ? IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
