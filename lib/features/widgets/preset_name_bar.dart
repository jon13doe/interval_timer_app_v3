import 'package:flutter/material.dart';

class PresetNameBar extends StatefulWidget {
  const PresetNameBar({
    super.key,
  });

  @override
  State<PresetNameBar> createState() => _PresetNameBarState();
}

class _PresetNameBarState extends State<PresetNameBar> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(
        height: 1,
        fontSize: 32,
      ),
      cursorHeight: 0.8 * 32,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.edit,
        ),
        hintText: 'Enter preset name',
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
