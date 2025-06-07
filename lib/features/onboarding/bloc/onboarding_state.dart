import 'package:equatable/equatable.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/models/onboarding_slide.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/models/pin_state.dart';


enum OnboardingStatus {
  initial,
  loading,
  loaded,
  error,
  completed,
  quickServices,
}

class OnboardingState extends Equatable {
  final OnboardingStatus status;
  final List<OnboardingSlide> slides;
  final int currentSlideIndex;
  final bool isAutoAdvanceEnabled;
  final PinState pinState;
  final String? errorMessage;
  final DateTime? startTime;

  const OnboardingState({
    this.status = OnboardingStatus.initial,
    this.slides = const [],
    this.currentSlideIndex = 0,
    this.isAutoAdvanceEnabled = true,
    this.pinState = const PinState(),
    this.errorMessage,
    this.startTime,
  });

  OnboardingSlide? get currentSlide {
    if (slides.isEmpty || currentSlideIndex >= slides.length) {
      return null;
    }
    return slides[currentSlideIndex];
  }

  bool get hasNextSlide => currentSlideIndex < slides.length - 1;
  bool get hasPreviousSlide => currentSlideIndex > 0;
  bool get isFirstSlide => currentSlideIndex == 0;
  bool get isLastSlide => currentSlideIndex == slides.length - 1;
  int get totalSlides => slides.length;

  OnboardingState copyWith({
    OnboardingStatus? status,
    List<OnboardingSlide>? slides,
    int? currentSlideIndex,
    bool? isAutoAdvanceEnabled,
    PinState? pinState,
    String? errorMessage,
    DateTime? startTime,
  }) {
    return OnboardingState(
      status: status ?? this.status,
      slides: slides ?? this.slides,
      currentSlideIndex: currentSlideIndex ?? this.currentSlideIndex,
      isAutoAdvanceEnabled: isAutoAdvanceEnabled ?? this.isAutoAdvanceEnabled,
      pinState: pinState ?? this.pinState,
      errorMessage: errorMessage,
      startTime: startTime ?? this.startTime,
    );
  }

  OnboardingState clearError() {
    return copyWith(errorMessage: null);
  }

  @override
  List<Object?> get props => [
        status,
        slides,
        currentSlideIndex,
        isAutoAdvanceEnabled,
        pinState,
        errorMessage,
        startTime,
      ];
}
