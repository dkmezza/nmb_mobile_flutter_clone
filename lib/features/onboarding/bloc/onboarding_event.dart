import 'package:equatable/equatable.dart';


abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingStarted extends OnboardingEvent {
  const OnboardingStarted();
}

class OnboardingSlideChanged extends OnboardingEvent {
  final int slideIndex;
  final bool isUserInitiated;

  const OnboardingSlideChanged({
    required this.slideIndex,
    this.isUserInitiated = false,
  });

  @override
  List<Object?> get props => [slideIndex, isUserInitiated];
}

class OnboardingNextSlide extends OnboardingEvent {
  const OnboardingNextSlide();
}

class OnboardingPreviousSlide extends OnboardingEvent {
  const OnboardingPreviousSlide();
}

class OnboardingAutoAdvanceToggled extends OnboardingEvent {
  final bool enabled;

  const OnboardingAutoAdvanceToggled({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class OnboardingCompleted extends OnboardingEvent {
  const OnboardingCompleted();
}

class OnboardingQuickServicesRequested extends OnboardingEvent {
  const OnboardingQuickServicesRequested();
}

class OnboardingPinDigitAdded extends OnboardingEvent {
  final String digit;

  const OnboardingPinDigitAdded({required this.digit});

  @override
  List<Object?> get props => [digit];
}

class OnboardingPinDigitRemoved extends OnboardingEvent {
  const OnboardingPinDigitRemoved();
}

class OnboardingPinCleared extends OnboardingEvent {
  const OnboardingPinCleared();
}

class OnboardingErrorCleared extends OnboardingEvent {
  const OnboardingErrorCleared();
}

