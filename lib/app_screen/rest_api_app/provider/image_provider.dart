import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/rest_api_app/model/api/dicebar_api.dart';

class ImageUrlProvider extends ChangeNotifier {
  String _imageUrl = '';

  final String alterImageUrl =
      'https://camo.githubusercontent.com/62f7147b015014d86f38098373baccc2b542d6301dc12b40df69ea85db35bf2c/68747470733a2f2f73636f74742e65652f696d616765732f6e756c6c2e706e67';

  String get imageUrl => _imageUrl;

  TextEditingController nameController = TextEditingController();

  Future<void> generateImage() async {
    _imageUrl = await fetchImage(nameController.text);
    notifyListeners();
  }
}
