import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  MySlider({Key key, this.max, this.divisions, this.callback})
      : super(key: key);

  final double max;
  final int divisions;
  final dynamic callback;

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
          widget.callback(value);
        });
      },
    );
  }
}
