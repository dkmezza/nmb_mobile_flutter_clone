import 'package:nmb_mobile_clone/features/onboarding/data/models/onboarding_slide.dart' show OnboardingSlide;
import '../../../../core/constants/app_constants.dart';


class OnboardingRepository {
  static const List<OnboardingSlide> _defaultSlides = [
    OnboardingSlide(
      id: 'banking_promotion',
      backgroundImagePath: AppConstants.onboarding1ImagePath,
      altText: 'Banking services promotion with cashback offers',
      order: 1,
    ),
    OnboardingSlide(
      id: 'shopping_experience',
      backgroundImagePath: AppConstants.onboarding2ImagePath,
      altText: 'Woman with shopping bags representing mobile commerce',
      order: 2,
    ),
    OnboardingSlide(
      id: 'mobile_payments',
      backgroundImagePath: AppConstants.onboarding3ImagePath,
      altText: 'Man on motorcycle with smartphone for mobile payments',
      order: 3,
    ),
    OnboardingSlide(
      id: 'fantasy_sports',
      backgroundImagePath: AppConstants.onboarding4ImagePath,
      altText: 'Fantasy League promotion with football theme',
      order: 4,
    ),
    OnboardingSlide(
      id: 'social_lifestyle',
      backgroundImagePath: AppConstants.onboarding5ImagePath,
      altText: 'Woman enjoying ice cream representing social lifestyle',
      order: 5,
    ),
  ];

  Future<List<OnboardingSlide>> getOnboardingSlides() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Later on, this would fetch from an API
    // For now, return the default slides
    return _defaultSlides;
  }

  Future<List<OnboardingSlide>> getActiveSlides() async {
    final slides = await getOnboardingSlides();
    return slides.where((slide) => slide.isActive).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<OnboardingSlide?> getSlideById(String id) async {
    final slides = await getOnboardingSlides();
    try {
      return slides.firstWhere((slide) => slide.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<bool> updateSlideConfiguration(List<OnboardingSlide> slides) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));
    
    // Later on, this would make an API call to update slide configuration
    // For now, just return success
    return true;
  }

  Future<void> trackSlideView(String slideId, Duration viewDuration) async {
    // Simulate analytics tracking
    await Future.delayed(const Duration(milliseconds: 100));
    
    // Later on, this would send analytics data
    print('Tracked slide view: $slideId for ${viewDuration.inSeconds}s');
  }

  Future<void> trackOnboardingCompletion(Duration totalDuration) async {
    // Simulate analytics tracking
    await Future.delayed(const Duration(milliseconds: 100));
    
    // Later on, this would send analytics data
    print('Tracked onboarding completion in ${totalDuration.inSeconds}s');
  }
}