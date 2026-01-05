import 'package:flutter/material.dart';
import 'animated_arc_widget.dart';

void showSuccessDialog(
    BuildContext context,
    VoidCallback onTap, {
      required String title,
      String? subTitle,
      String? buttonText,
    }) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (_) {
      return PopScope(
        canPop: false,
        child: Center(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AnimatedArcWidget(),
                  const SizedBox(height: 20),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                  if (subTitle != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      subTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: onTap,
                    child: Text(buttonText ?? "Okay"),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
