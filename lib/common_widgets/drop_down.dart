import 'package:atlanta/ui/utils/defaults.dart';
import 'package:atlanta/ui/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final dynamic value;
  final List<DropdownMenuItem> menuItems;
  final void Function(dynamic) onChanged;
  const CustomDropdownButton(
      {Key? key,
      required this.value,
      required this.menuItems,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        hint: const StyledText(text: 'choose category'),
        underline: const SizedBox(),
        alignment: Alignment.centerLeft,
        style: const TextStyle(color: primary),
        elevation: 0,
        value: widget.value,
        items: widget.menuItems,
        onChanged: widget.onChanged);
  }
}