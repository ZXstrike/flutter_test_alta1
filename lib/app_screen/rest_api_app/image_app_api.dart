import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/rest_api_app/provider/image_provider.dart';
import 'package:flutter_test_alta1/app_screen/rest_api_app/view/image_app_view.dart';
import 'package:provider/provider.dart';

class ImageAppApi extends StatelessWidget {
  const ImageAppApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImageUrlProvider>(
            create: (_) => ImageUrlProvider())
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageAppView(),
      ),
    );
  }
}
