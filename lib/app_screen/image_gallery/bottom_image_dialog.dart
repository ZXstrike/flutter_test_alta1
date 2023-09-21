import 'package:flutter/material.dart';

class BottomImageDialog extends StatefulWidget {
  const BottomImageDialog({
    super.key,
    required this.imagePath,
    required this.onApprove,
    required this.onCancel,
  });

  final String imagePath;
  final void Function() onApprove;
  final void Function() onCancel;

  @override
  State<BottomImageDialog> createState() => _BottomImageDialogState();
}

class _BottomImageDialogState extends State<BottomImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          widget.imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 350,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: widget.onCancel,
                  child: const Text("Cancel"),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: widget.onApprove,
                  child: const Text("Ok"),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
