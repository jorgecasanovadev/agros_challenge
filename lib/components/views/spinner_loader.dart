import 'package:flutter/material.dart';

class SpinnerLoader extends StatelessWidget {
  const SpinnerLoader({Key? key, this.opacity = 0.5, this.color = Colors.white})
      : super(key: key);
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: ModalBarrier(
            dismissible: false,
            color: color,
          ),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
