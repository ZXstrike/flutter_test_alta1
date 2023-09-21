import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class AdvanceInputMS extends StatefulWidget {
  const AdvanceInputMS({super.key});

  @override
  State<AdvanceInputMS> createState() => _AdvanceInputMSState();
}

class _AdvanceInputMSState extends State<AdvanceInputMS> {
  Color _currentColor = Colors.orange;

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'png', 'gif', 'jpg']);

    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Advance Input"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              controller: dateController,
              onTap: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1990),
                  lastDate: DateTime((DateTime.now().year + 5)),
                );

                if (selectedDate != null) {
                  dateController.text =
                      DateFormat('dd-MM-yyyy').format(selectedDate);
                }
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                hintText: 'DD/MM/YY',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF49454F),
                ),
                labelText: 'date',
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: _currentColor,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: _currentColor,
                              onColorChanged: (color) {
                                setState(() {
                                  _currentColor = color;
                                });
                              },
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Exit"),
                            ),
                          ],
                        );
                      });
                },
                child: const Text("Pick Color!"),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _pickFile();
                },
                child: const Text("Pick File"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
