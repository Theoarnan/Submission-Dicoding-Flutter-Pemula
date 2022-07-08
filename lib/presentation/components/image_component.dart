import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String imageUrl;
  const ImageComponent({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: FadeInImage(
        image: NetworkImage(imageUrl),
        placeholder: const AssetImage("assets/loading.gif"),
        imageErrorBuilder: (context, exception, stackTrace) {
          return Image.asset('assets/img_no_image.png');
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
