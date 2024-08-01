import 'package:flutter/material.dart';

class DynamicIconButton extends StatefulWidget {
  final int? initIndex;
  final List<IconData> iconsList;
  final double? iconSize;
  final void Function(int) onStateChange;

  const DynamicIconButton({
    super.key,
    this.initIndex,
    required this.iconsList,
    this.iconSize,
    required this.onStateChange,
  });

  @override
  State<DynamicIconButton> createState() => _DynamicIconButtonState();
}

class _DynamicIconButtonState extends State<DynamicIconButton> {
  int _iconIndex = 0;

  @override
  void initState() {
    super.initState();
    _iconIndex = widget.initIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: 
      Icon(widget.iconsList[_iconIndex]),
      iconSize: widget.iconSize,
      onPressed: () {
        if (_iconIndex != widget.iconsList.length - 1) {
          _iconIndex++;
          } else {
            _iconIndex = 0;
          }
          widget.onStateChange(_iconIndex);
      },
    );
  }
}