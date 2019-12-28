import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class VirtualKnob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xFF1A237E),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: _Knob(),
    );
  }
}

class _Knob extends StatefulWidget {
  @override
  __KnobState createState() => __KnobState();
}

class __KnobState extends State<_Knob> {
  ScrollController _controller;
  int _diff = 0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(onScrolled);
  }

  void onScrolled() {
    setState(() {
      _diff++;
    });

    if (_diff > 12) {
      _diff = 0;
      Vibration.vibrate(duration: 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      controller: _controller,
      itemBuilder: (_, index) {
        return Container(
          height: 2,
          width: 32,
          color: Colors.grey,
          margin: const EdgeInsets.symmetric(vertical: 6),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
