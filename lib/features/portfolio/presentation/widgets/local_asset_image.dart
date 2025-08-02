import 'package:flutter/material.dart';

class LocalAssetImage extends StatelessWidget {
  final String imageName;
  final BoxFit? fit;
  final double? width;
  final double? height;

  const LocalAssetImage({
    super.key,
    required this.imageName,
    this.fit,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    // In a real app, ensure your assets are in pubspec.yaml
    // and the path is correct.
    // For web, ensure assets/assets/images... if using the default flutter create structure
    // For mobile, assets/images/...
    // This is a placeholder, replace with your actual Image.asset logic
    return Image.asset(
      imageName, // Crucial: Ensure this path is correct
      fit: fit,
      width: width,
      height: height,
      errorBuilder: (context, error, stackTrace) {
        // print("Error loading image $imageName: $error"); // Log error
        return Container(
          color: Colors.grey[200],
          child: const Center(
            child: Icon(Icons.broken_image, size: 50, color: Colors.redAccent),
          ),
        );
      },
    );
  }
}