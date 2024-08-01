import 'package:flutter/material.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({super.key});

  @override
  State<VolumeSlider> createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  double volume = 50;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: volume,
      min: 0.0,
      max: 100.0,
      onChanged: (newValue) {
        setState(() {
          volume = newValue;
        });
      },
    );
  }
}
