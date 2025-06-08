import 'package:flutter/material.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/models/onboarding_slide.dart';

class OnboardingSlideWidget extends StatelessWidget {
  final OnboardingSlide slide;
  final bool isActive;

  const OnboardingSlideWidget({
    super.key,
    required this.slide,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        slide.backgroundImagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildErrorWidget(context);
        },
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.primaryBlue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported,
              size: 64,
              color: AppColors.whiteBackground.withOpacity(0.7),
            ),
            const SizedBox(height: AppDimensions.mediumPadding),
            Text(
              'Image not available',
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.whiteBackground.withOpacity(0.7),
              ),
            ),
            if (slide.altText != null) ...[
              const SizedBox(height: AppDimensions.smallPadding),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.largePadding,
                ),
                child: Text(
                  slide.altText!,
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.whiteBackground.withOpacity(0.5),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
