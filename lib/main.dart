import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_test_alta1/app_screen/UI/cupertino_app/cupertino_home_page.dart';
import 'package:flutter_test_alta1/app_screen/UI/material_app/material_home_page.dart';
import 'package:flutter_test_alta1/app_screen/UI/prototype/my_flutter.dart';
import 'package:flutter_test_alta1/app_screen/advance_input_field/advance_input_main_screen.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_screen/get_contact_view.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/gallery_screen_view.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/image_focus.dart';
import 'package:flutter_test_alta1/app_screen/main_screen/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => const MainScreen(),
            );
          case '/getContact':
            return MaterialPageRoute(
              builder: (context) => const GetContactView(),
            );

          case '/advanceInput':
            return MaterialPageRoute(
              builder: (context) => const AdvanceInputMS(),
            );
          case '/galleryGrid':
            return MaterialPageRoute(
              builder: (context) => const GalleryScreenView(),
            );
          case '/imageFocus':
            return MaterialPageRoute(
              builder: (context) => ImageFocusPage(
                imagePath: settings.arguments.toString(),
              ),
            );
          case '/myFlutterApp':
            return MaterialPageRoute(
              builder: (context) => const MyFlutter(),
            );
          case '/materialHome':
            return MaterialPageRoute(
              builder: (context) => const MaterialHomePage(),
            );
          case '/cuppertino':
            return CupertinoPageRoute(
              builder: (context) => const CupertinoHomePage(),
            );
        }
        return null;
      },
    );
  }
}
