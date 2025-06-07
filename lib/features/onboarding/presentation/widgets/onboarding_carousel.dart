import 'package:flutter/material.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/models/onboarding_slide.dart';
import 'package:nmb_mobile_clone/features/onboarding/presentation/widgets/onboarding_slide_widget.dart';


class OnboardingCarousel extends StatelessWidget {
  final PageController pageController;
  final List<OnboardingSlide> slides;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const OnboardingCarousel({
    super.key,
    required this.pageController,
    required this.slides,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: slides.length,
      itemBuilder: (context, index) {
        return OnboardingSlideWidget(
          slide: slides[index],
          isActive: index == currentIndex,
        );
      },
    );
  }
}
