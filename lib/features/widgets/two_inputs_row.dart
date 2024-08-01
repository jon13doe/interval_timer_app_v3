import 'package:flutter/material.dart';

import 'input_field.dart';

class TwoInputsRow extends StatefulWidget {
  final num initValue;
  final num maxValueFirst;
  final num maxValueSecond;
  final double numSize;
  final bool zeroExist;
  final void Function(num) onChange;
  final double width;

  const TwoInputsRow({
    super.key,
    required this.initValue,
    required this.maxValueFirst,
    required this.maxValueSecond,
    required this.numSize,
    required this.zeroExist,
    required this.onChange,
    required this.width,
  });

  @override
  State<TwoInputsRow> createState() => _CustomTwoNumsRowState();
}

class _CustomTwoNumsRowState extends State<TwoInputsRow> {
  late num _currentValue;
  late num _currentValueFirstBox;
  late num _currentValueSecondBox;
  late num _maxValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initValue;
    _currentValueFirstBox = widget.initValue ~/ 60;
    _currentValueSecondBox = widget.initValue % 60;
    _maxValue = widget.maxValueFirst * 60 + widget.maxValueSecond;
  }

  void _incrementValue() {
    setState(() {
      if (_currentValue < _maxValue - 1) {
        _currentValue++;
      } else {
        _currentValue = 0;
      }
      _currentValueFirstBox = _currentValue ~/ 60;
      _currentValueSecondBox = _currentValue % 60;
      widget.onChange(_currentValue);
    });
  }

  void _decrementValue() {
    setState(() {
      if (_currentValue > 0) {
        _currentValue--;
      } else {
        _currentValue = _maxValue - 1;
      }
      _currentValueFirstBox = _currentValue ~/ 60;
      _currentValueSecondBox = _currentValue % 60;
      widget.onChange(_currentValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.amberAccent,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _decrementValue,
              icon: const Icon(Icons.remove),
            ),
            Row(
              children: [
                InputField(
                  numImput: true,
                  initValue: _currentValueFirstBox,
                  maxValue: widget.maxValueFirst,
                  fontSize: widget.numSize,
                  descriptionText: 'min',
                  onInput: (newValue) {
                    setState(() {
                      _currentValue -= _currentValueFirstBox * 60;
                      _currentValue += newValue * 60;
                      _currentValueFirstBox = newValue;
                      widget.onChange(_currentValue);
                    });
                  },
                ),
                SizedBox(
                  height: 1.2 * widget.numSize,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Text(
                        ':',
                        style: TextStyle(fontSize: 0.75 * widget.numSize),
                      ),
                    ],
                  ),
                ),
                InputField(
                  numImput: true,
                  initValue: _currentValueSecondBox,
                  maxValue: widget.maxValueSecond.toInt(),
                  fontSize: widget.numSize,
                  descriptionText: 'sec',
                  onInput: (newValue) {
                    setState(() {
                      _currentValue -= _currentValueSecondBox;
                      _currentValue += newValue;
                      if (_currentValue > _maxValue) {
                        _currentValue -= _maxValue;
                      }
                      _currentValueFirstBox = _currentValue ~/ 60;
                      _currentValueSecondBox = _currentValue % 60;
                      widget.onChange(_currentValue);
                    });
                  },
                ),
              ],
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
