import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_alta1/app_screen/rest_api_app/provider/image_provider.dart';
import 'package:provider/provider.dart';

class ImageAppView extends StatefulWidget {
  const ImageAppView({super.key});

  @override
  State<ImageAppView> createState() => _ImageAppViewState();
}

class _ImageAppViewState extends State<ImageAppView> {
  late ImageUrlProvider imageProvider;

  @override
  void initState() {
    super.initState();

    imageProvider = Provider.of<ImageUrlProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Generator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 40),
            child: Consumer<ImageUrlProvider>(
              builder: (context, value, child) => value.imageUrl.isEmpty
                  ? Image.network(
                      value.alterImageUrl,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    )
                  : SvgPicture.string(
                      value.imageUrl,
                      height: 120,
                      width: 120,
                    ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: imageProvider.nameController,
              decoration: const InputDecoration(
                  hintText: 'FirstName', label: Text('Name')),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: imageProvider.generateImage,
              child: const Text('Generate'))
        ],
      ),
    );
  }
}
