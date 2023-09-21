import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/gallery_grid_view.dart';

class GalleryScreenView extends StatelessWidget {
  const GalleryScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: GalleryGridView(),
    );
  }
}
