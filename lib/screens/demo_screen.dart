import 'package:flutter/material.dart';
import '../widgets/success_dialog.dart';

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success Dialog Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showSuccessDialog(
              context,
                  () => Navigator.pop(context),
              title: "Payment Successful",
              subTitle: "Your transaction was completed successfully",
            );
          },
          child: const Text("Show Success Dialog"),
        ),
      ),
    );
  }
}