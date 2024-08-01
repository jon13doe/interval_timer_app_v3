import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final bool? numImput;
  final dynamic initValue;
  final num? maxValue;
  final double fontSize;
  final String? descriptionText;

  final void Function(dynamic) onInput;

  const InputField(
      {super.key,
      this.numImput,
      required this.initValue,
      this.maxValue,
      required this.fontSize,
      this.descriptionText,
      required this.onInput});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late dynamic _inputValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.numImput == false
          ? 0.5 * MediaQuery.of(context).size.width
          : 1.25 * widget.fontSize,
      height: 1.2 * widget.fontSize,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.white,
              child: TextField(
                keyboardType: widget.numImput == false
                    ? TextInputType.text
                    : TextInputType.number,
                maxLength: widget.numImput == false
                    ? 10
                    : widget.maxValue.toString().length,
                controller: TextEditingController(
                  text: widget.numImput == false
                      ? widget.initValue
                      : widget.initValue.toString().padLeft(2, '0'),
                ),
                textAlign: TextAlign.right,
                style: TextStyle(
                  height: 1,
                  fontSize: widget.fontSize,
                  fontWeight: widget.numImput == false
                      ? FontWeight.w600
                      : FontWeight.w500,
                ),
                cursorHeight: 0.8 * widget.fontSize,
                cursorColor: Theme.of(context).colorScheme.secondary,
                enableInteractiveSelection: false,
                decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
                inputFormatters: widget.numImput == false
                    ? [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9а-яА-Я]'))
                      ]
                    : [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.done,
                onSubmitted: (text) {
                  setState(() {
                    _inputValue =
                        widget.numImput == false ? text : num.parse(text);
                    widget.onInput(_inputValue);
                  });
                },
              ),
            ),
          ),
          if (widget.descriptionText != null)
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.descriptionText!,
                style: TextStyle(
                  fontSize: 0.2 * widget.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
