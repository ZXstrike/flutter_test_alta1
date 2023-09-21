import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/advance_input_field/advance_input_main_screen.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_screen/get_contact_view.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/gallery_screen_view.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/image_focus.dart';

void main() {
  runApp(const GalleryApps());
}

class GalleryApps extends StatelessWidget {
  const GalleryApps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const GalleryScreenView(),
            );
          case '/imageFocus':
            return MaterialPageRoute(
              builder: (context) => ImageFocusPage(
                imagePath: settings.arguments.toString(),
              ),
            );
        }
        return null;
      },
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/advanceinput',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/getcontact':
            return MaterialPageRoute(
              builder: (context) => const GetContactView(),
            );
          case "/advanceinput":
            return MaterialPageRoute(
              builder: (context) => const AdvanceInputMS(),
            );
        }
        return null;
      },
    );
  }
}
