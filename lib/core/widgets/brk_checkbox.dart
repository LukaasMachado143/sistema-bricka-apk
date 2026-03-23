import 'package:flutter/material.dart';

class BrkCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final bool required;
  final Function(bool?) onChanged;

  const BrkCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.required = false,
  });

  @override
  State<BrkCheckbox> createState() => _BrkCheckboxState();
}

class _BrkCheckboxState extends State<BrkCheckbox> {
  bool hasError = false;

  void validate() {
    if (widget.required && !widget.value) {
      setState(() => hasError = true);
    } else {
      setState(() => hasError = false);
    }
  }

  @override
  void didUpdateWidget(covariant BrkCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (hasError && widget.value) {
      setState(() => hasError = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    final color = hasError ? Colors.red : primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: widget.value,
              onChanged: (value) {
                widget.onChanged(value);
                validate();
              },
              activeColor: primaryColor,
              side: BorderSide(
                color: hasError ? Colors.red : Colors.grey,
                width: 1.5,
              ),
            ),

            const SizedBox(width: 8),

            Text(
              widget.label,
              style: TextStyle(
                color: hasError ? Colors.red : Colors.grey[700],
                fontSize: 14,
              ),
            ),
          ],
        ),

        if (hasError)
          const Padding(
            padding: EdgeInsets.only(left: 4, top: 4),
            child: Text(
              'Este campo é obrigatório',
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
