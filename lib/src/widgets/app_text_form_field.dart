import 'package:flutter/material.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.obsecure = false,
    this.label,
    this.hintText,
    this.validator,
  });

  final TextEditingController? controller;
  final bool obsecure;
  final String? label;
  final String? hintText;
  final String? Function(String)? validator;

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
        widget.label != null
            ? Text(
                widget.label!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            : const SizedBox.shrink(),
        TextFormField(
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
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: InputDecoration(
            hintText: widget.hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
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
