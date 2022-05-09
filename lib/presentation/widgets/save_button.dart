import 'package:bloc_example/presentation.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final void Function()? onPressed;

  const SaveButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text(
        'Salva',
        style: PresetTextStyle.white17w600,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(
          double.maxFinite,
          50,
        ),
      ),
    );
  }
}
