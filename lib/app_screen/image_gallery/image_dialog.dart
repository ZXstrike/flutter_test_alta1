import 'package:flutter/material.dart';

class ImageDialog extends StatefulWidget {
  const ImageDialog({
    super.key,
    required this.imagePath,
    required this.onApprove,
    required this.onCancel,
  });

  final String imagePath;
  final void Function() onApprove;
  final void Function() onCancel;

  @override
  State<ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 350,
          ),
          SizedBox(
            height: 75,
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
