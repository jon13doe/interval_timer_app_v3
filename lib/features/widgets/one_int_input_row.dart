import 'package:flutter/material.dart';

import 'input_field.dart';

class OneIntInputRow extends StatefulWidget {
  final int initValue;
  final int maxValue;
  final double numSize;
  final bool zeroExist;
  final void Function(int) onChange;
  final double width;

  const OneIntInputRow(
      {super.key,
      required this.initValue,
      required this.maxValue,
      required this.numSize,
      required this.zeroExist,
      required this.onChange,
      required this.width});

  @override
  State<OneIntInputRow> createState() => _OneIntInputRowState();
}

class _OneIntInputRowState extends State<OneIntInputRow> {
  late int _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initValue;
  }

  void _incrementValue() {
    setState(() {
      if (_currentValue < widget.maxValue) {
        _currentValue++;
      } else {
        _currentValue = 0 + (widget.zeroExist ? 0 : 1);
      }
      widget.onChange(_currentValue);
    });
  }

  void _decrementValue() {
    setState(() {
      if (_currentValue > 0 + (widget.zeroExist ? 0 : 1)) {
        _currentValue--;
      } else {
        _currentValue = widget.maxValue;
      }
      widget.onChange(_currentValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _decrementValue,
              icon: const Icon(Icons.remove),
            ),
            InputField(
              numImput: true,
              initValue: _currentValue,
              maxValue: widget.maxValue,
              fontSize: widget.numSize,
              onInput: (newValue) {
                setState(() {
                  _currentValue = newValue;
                  widget.onChange(_currentValue);
                });
              },
            ),
            IconButton(
              onPressed: _incrementValue,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
