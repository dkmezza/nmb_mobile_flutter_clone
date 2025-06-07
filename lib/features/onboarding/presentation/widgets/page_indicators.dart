import 'package:flutter/material.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';


class PageIndicators extends StatelessWidget {
  final int totalSlides;
  final int currentIndex;

  const PageIndicators({
    super.key,
    required this.totalSlides,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSlides,
        (index) => _buildIndicator(index),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    final isActive = index == currentIndex;
    
    return AnimatedContainer(
      duration: AppConstants.shortAnimationDuration,
      curve: AppCurves.defaultCurve,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.indicatorSpacing / 2,
      ),
      width: AppDimensions.indicatorSize,
      height: AppDimensions.indicatorSize,
      decoration: BoxDecoration(
        color: isActive 
            ? AppColors.activeIndicatorColor 
            : AppColors.inactiveIndicatorColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
