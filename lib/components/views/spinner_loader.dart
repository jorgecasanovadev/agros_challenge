import 'package:flutter/material.dart';

class SpinnerLoader extends StatelessWidget {
  const SpinnerLoader({Key? key, this.opacity = 0.5}) : super(key: key);
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: const ModalBarrier(
            dismissible: false,
            color: Colors.white,
          ),
        ),
        const Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
