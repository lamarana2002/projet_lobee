import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback? onPressed;
  const ButtonSubmit({super.key, required this.textColor,  required this.buttonColor, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor
                  ),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                      ),
                  ),
                ),
              ),
            );
  }
}