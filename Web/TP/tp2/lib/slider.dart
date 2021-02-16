import 'package:flutter/material.dart';
import 'image.dart';

class MySlider extends StatefulWidget {
  MySlider({Key key, this.image, this.max, this.divisions}) : super(key: key);

  final MyImage image;
  final double max;
  final int divisions;

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _currentValue,
      min: 0,
      max: widget.max,
      divisions: widget.divisions,
      label: _currentValue.round().toString(),
      onChanged: (double value) {
        setState(() {
          _currentValue = value;
        });
      },
    );
  }
}
