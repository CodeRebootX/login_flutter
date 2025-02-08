import 'package:flutter/material.dart';

class CustomEButton extends StatelessWidget {
  final String text;
  final Function myFunction;
  const CustomEButton ({super.key, required this.text, required this.myFunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.amber,
          backgroundColor: Colors.black12,
        ),
        onPressed: () {
          myFunction();
        },
        child: Text(text),
      ),
    );
  }
}