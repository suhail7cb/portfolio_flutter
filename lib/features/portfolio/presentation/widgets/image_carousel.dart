import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_flutter/features/portfolio/presentation/widgets/local_asset_image.dart';

// Assuming your LocalAssetImage widget is defined
// import 'path/to/your/local_asset_image.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageNames;
  final double? height;
  final double? width;
  final Duration autoScrollDuration;
  final Duration transitionDuration;
  final Curve scrollCurve;
  final BoxFit imageFit;
  final double viewportFraction;

  const ImageCarousel({
    super.key,
    required this.imageNames,
    this.height,
    this.width,
    this.autoScrollDuration = const Duration(seconds: 5),
    this.transitionDuration = const Duration(milliseconds: 800),
    this.scrollCurve = Curves.fastOutSlowIn,
    this.imageFit = BoxFit.cover, // Default to cover for good face visibility
    this.viewportFraction = 1.0, // For full-width images, 1.0 is typical
  });

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  late PageController _pageController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;
  // To achieve circular scrolling, we can use a very large number of items
  // and then map the index back to our actual image list.
  // Or, more practically for PageView, handle the jump at the ends.
  // For simpler circular illusion with PageController, we can jump without animation.

  // A common technique for smoother circular scrolling is to have a "virtual"
  // very large number of pages, or to add duplicate items at the ends.
  // Let's go with a simpler jump for now, which is often sufficient.
  // For true infinite feel, you might use a much larger itemCount and modulo.

  @override
  void initState() {
    super.initState();
    // Start from a page that allows scrolling back to the "end" if needed for circular effect
    // For a simpler circular effect, we'll handle jumps in the timer.
    _currentPage = widget.imageNames.isNotEmpty ? 0 : 0;
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: widget.viewportFraction,
    );
    _startAutoScroll();
  }

  void _startAutoScroll() {
    if (widget.imageNames.length <= 1) return; // No scroll if 1 or 0 images

    _autoScrollTimer?.cancel();
    _autoScrollTimer = Timer.periodic(widget.autoScrollDuration, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      int nextPage = _currentPage + 1;
      if (nextPage >= widget.imageNames.length) {
        nextPage = 0; // Loop back to the first image
        if (_pageController.hasClients) {
          _pageController.jumpToPage(nextPage); // Jump for seamless loop
        }
      } else {
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            nextPage,
            duration: widget.transitionDuration,
            curve: widget.scrollCurve,
          );
        }
      }
      // _currentPage is updated by onPageChanged
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double carouselHeight = widget.height ?? 300.h; // Default height
    final double? carouselWidth = widget.width;

    if (widget.imageNames.isEmpty) {
      return SizedBox(
        height: carouselHeight,
        width: carouselWidth,
        child: const Center(child: Text("No images")),
      );
    }

    return Container(
      width: carouselWidth,
      height: carouselHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.white.withOpacity(0.1),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.imageNames.length, // Number of actual images
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
            // Optional: If you want to pause auto-scroll on manual interaction
            // and restart it after a delay, you can add logic here.
            // For now, it continues, which is common.
          },
          itemBuilder: (context, index) {
            // The index here is the direct index for your imageNames list
            final imageName = widget.imageNames[index];
            return Container(
              color: Colors.grey[300], // Background for each image slide
              child: AspectRatio(
                aspectRatio: 1, // Maintain a square aspect ratio for the image container
                // Adjust if your images have a different common aspect ratio
                child: LocalAssetImage(
                  imageName: imageName,
                  fit: widget.imageFit, // Use the passed BoxFit
                  // BoxFit.cover will scale the image to fill the bounds,
                  // potentially cropping some parts, but usually centers well.
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
