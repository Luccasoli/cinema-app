import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final String initialValue;
  final void Function(String) onChanged;

  SearchBarWidget({
    this.enabled = true,
    this.controller,
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: TextFormField(
        autofocus: true,
        enabled: enabled,
        initialValue: initialValue,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Type something',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
