import 'package:flutter/material.dart';
import 'package:ims/utils/constants.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Text(Kloading),
        SizedBox(
          height: 30,
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Continue",
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
