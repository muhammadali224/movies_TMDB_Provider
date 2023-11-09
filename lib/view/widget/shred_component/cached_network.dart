import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/api_link.dart';

class CustomCachedNetwork extends StatelessWidget {
  final String imageUrl;
  final BorderRadiusGeometry? borderRadius;
  final double? height;
  final double? width;

  const CustomCachedNetwork(
      {super.key,
      required this.imageUrl,
      this.borderRadius,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "${AppLink.imagePath}$imageUrl",
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red),
          Text("No Image Found")
        ],
      ),
      imageBuilder: (context, provider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: provider,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            )),
      ),
    );
  }
}
