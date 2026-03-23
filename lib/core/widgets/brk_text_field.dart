import 'package:flutter/material.dart';

class BrkTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData? icon;
  final bool required;
  final VoidCallback? onIconPressed;
  final bool? obscureText;
  final bool? disabled;

  const BrkTextField({
    super.key,
    required this.label,
    required this.controller,
    this.icon,
    this.required = false,
    this.onIconPressed,
    this.obscureText = false,
    this.disabled = false,
  });

  @override
  State<BrkTextField> createState() => _BrkTextFieldState();
}

class _BrkTextFieldState extends State<BrkTextField> {
  bool hasError = false;

  void validate() {
    if (widget.required && widget.controller.text.trim().isEmpty) {
      setState(() => hasError = true);
    } else {
      setState(() => hasError = false);
    }
  }

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      if (hasError && widget.controller.text.isNotEmpty) {
        setState(() => hasError = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final color = hasError ? Colors.red : primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          obscureText: widget.obscureText ?? false,
          readOnly: widget.disabled ?? false,
          cursorColor: primaryColor,
          onEditingComplete: validate,
          decoration: InputDecoration(
            isDense: true,

            labelText: widget.label,

            floatingLabelBehavior: FloatingLabelBehavior.auto,

            labelStyle: TextStyle(color: hasError ? Colors.red : Colors.grey),

            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: color, width: 2),
            ),

            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),

            focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2),
            ),

            suffixIcon: widget.icon != null
                ? IconButton(
                    icon: Icon(widget.icon, color: color, size: 24),
                    onPressed: widget.onIconPressed,
                  )
                : null,

            errorText: null,
          ),
        ),

        if (hasError)
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              'Este campo é obrigatório',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
