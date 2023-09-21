import 'package:flutter/material.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/bottom_image_dialog.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/cust_fun.dart';
import 'package:flutter_test_alta1/app_screen/image_gallery/image_card.dart';

class GalleryGridView extends StatefulWidget {
  const GalleryGridView({super.key});

  @override
  State<GalleryGridView> createState() => _GalleryGridViewState();
}

class _GalleryGridViewState extends State<GalleryGridView> {
  List<String>? _imagePathList;

  @override
  void initState() {
    super.initState();

    loadImage();
  }

  void loadImage() async {
    final List<String> folderList = await getFilePathFrom("lib/assets/images/");
    setState(() {
      _imagePathList = folderList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_imagePathList != null) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: _imagePathList!.length,
        itemBuilder: (contextt, index) {
          final String imagePath = _imagePathList![index];
          return ImageCard(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BottomImageDialog(
                  imagePath: imagePath,
                  onApprove: () {
                    Navigator.popAndPushNamed(context, '/imageFocus',
                        arguments: imagePath);
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
            imagePath: imagePath,
          );
        },
      );
    } else {
      return const Center(
        child: Text('Nothing Huh?..'),
      );
    }
  }
}
