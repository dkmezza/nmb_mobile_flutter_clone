import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_event.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_state.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/repositories/onboarding_repository.dart';


class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final OnboardingRepository _repository;
  Timer? _autoAdvanceTimer;
  Timer? _slideViewTimer;
  DateTime? _slideStartTime;

  OnboardingBloc({
    required OnboardingRepository repository,
  })  : _repository = repository,
        super(const OnboardingState()) {
    on<OnboardingStarted>(_onOnboardingStarted);
    on<OnboardingSlideChanged>(_onOnboardingSlideChanged);
    on<OnboardingNextSlide>(_onOnboardingNextSlide);
    on<OnboardingPreviousSlide>(_onOnboardingPreviousSlide);
    on<OnboardingAutoAdvanceToggled>(_onOnboardingAutoAdvanceToggled);
    on<OnboardingCompleted>(_onOnboardingCompleted);
    on<OnboardingQuickServicesRequested>(_onOnboardingQuickServicesRequested);
    on<OnboardingPinDigitAdded>(_onOnboardingPinDigitAdded);
    on<OnboardingPinDigitRemoved>(_onOnboardingPinDigitRemoved);
    on<OnboardingPinCleared>(_onOnboardingPinCleared);
    on<OnboardingErrorCleared>(_onOnboardingErrorCleared);
  }

  @override
  Future<void> close() {
    _autoAdvanceTimer?.cancel();
    _slideViewTimer?.cancel();
    return super.close();
  }

  Future<void> _onOnboardingStarted(
    OnboardingStarted event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: OnboardingStatus.loading,
        startTime: DateTime.now(),
      ));

      final slides = await _repository.getActiveSlides();

      if (slides.isEmpty) {
        emit(state.copyWith(
          status: OnboardingStatus.error,
          errorMessage: 'No onboarding slides available',
        ));
        return;
      }

      emit(state.copyWith(
        status: OnboardingStatus.loaded,
        slides: slides,
        currentSlideIndex: 0,
      ));

      _startSlideViewTracking();
      _startAutoAdvanceTimer();
    } catch (e) {
      emit(state.copyWith(
        status: OnboardingStatus.error,
        errorMessage: 'Failed to load onboarding content: ${e.toString()}',
      ));
    }
  }

  Future<void> _onOnboardingSlideChanged(
    OnboardingSlideChanged event,
    Emitter<OnboardingState> emit,
  ) async {
    if (event.slideIndex < 0 || event.slideIndex >= state.slides.length) {
      return;
    }

    _trackCurrentSlideView();

    emit(state.copyWith(
      currentSlideIndex: event.slideIndex,
    ));

    _startSlideViewTracking();

    if (event.isUserInitiated) {
      _resetAutoAdvanceTimer();
    }
  }

  Future<void> _onOnboardingNextSlide(
    OnboardingNextSlide event,
    Emitter<OnboardingState> emit,
  ) async {
    if (state.hasNextSlide) {
      add(OnboardingSlideChanged(
        slideIndex: state.currentSlideIndex + 1,
        isUserInitiated: true,
      ));
    }
  }

  Future<void> _onOnboardingPreviousSlide(
    OnboardingPreviousSlide event,
    Emitter<OnboardingState> emit,
  ) async {
    if (state.hasPreviousSlide) {
      add(OnboardingSlideChanged(
        slideIndex: state.currentSlideIndex - 1,
        isUserInitiated: true,
      ));
    }
  }

  Future<void> _onOnboardingAutoAdvanceToggled(
    OnboardingAutoAdvanceToggled event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(isAutoAdvanceEnabled: event.enabled));

    if (event.enabled) {
      _startAutoAdvanceTimer();
    } else {
      _autoAdvanceTimer?.cancel();
    }
  }

  Future<void> _onOnboardingCompleted(
    OnboardingCompleted event,
    Emitter<OnboardingState> emit,
  ) async {
    _trackCurrentSlideView();
    _autoAdvanceTimer?.cancel();
    _slideViewTimer?.cancel();

    if (state.startTime != null) {
      final duration = DateTime.now().difference(state.startTime!);
      await _repository.trackOnboardingCompletion(duration);
    }

    emit(state.copyWith(status: OnboardingStatus.completed));
  }

  Future<void> _onOnboardingQuickServicesRequested(
    OnboardingQuickServicesRequested event,
    Emitter<OnboardingState> emit,
  ) async {
    _trackCurrentSlideView();
    _autoAdvanceTimer?.cancel();
    _slideViewTimer?.cancel();

    emit(state.copyWith(status: OnboardingStatus.quickServices));
  }

  Future<void> _onOnboardingPinDigitAdded(
    OnboardingPinDigitAdded event,
    Emitter<OnboardingState> emit,
  ) async {
    final newPinState = state.pinState.addDigit(event.digit);
    emit(state.copyWith(pinState: newPinState));

    // For demo purposes, I'll just update the state
    // Later on I will update this, this would trigger authentication when PIN is complete
    if (newPinState.isFull) {
      // TODO: Will Add authentication logic here
      print('PIN entered: ${newPinState.enteredPin}');
    }
  }

  Future<void> _onOnboardingPinDigitRemoved(
    OnboardingPinDigitRemoved event,
    Emitter<OnboardingState> emit,
  ) async {
    final newPinState = state.pinState.removeDigit();
    emit(state.copyWith(pinState: newPinState));
  }

  Future<void> _onOnboardingPinCleared(
    OnboardingPinCleared event,
    Emitter<OnboardingState> emit,
  ) async {
    final newPinState = state.pinState.clear();
    emit(state.copyWith(pinState: newPinState));
  }

  Future<void> _onOnboardingErrorCleared(
    OnboardingErrorCleared event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.clearError());
  }

  void _startAutoAdvanceTimer() {
    if (!state.isAutoAdvanceEnabled) return;

    _autoAdvanceTimer?.cancel();
    _autoAdvanceTimer = Timer(AppConstants.autoAdvanceInterval, () {
      if (state.hasNextSlide) {
        add(OnboardingSlideChanged(
          slideIndex: state.currentSlideIndex + 1,
          isUserInitiated: false,
        ));
      } else {
        // Auto-advance completed, restart from beginning or stop
        _autoAdvanceTimer?.cancel();
      }
    });
  }

  void _resetAutoAdvanceTimer() {
    if (!state.isAutoAdvanceEnabled) return;
    _startAutoAdvanceTimer();
  }

  void _startSlideViewTracking() {
    _slideStartTime = DateTime.now();
  }

  void _trackCurrentSlideView() {
    if (_slideStartTime != null && state.currentSlide != null) {
      final viewDuration = DateTime.now().difference(_slideStartTime!);
      _repository.trackSlideView(state.currentSlide!.id, viewDuration);
    }
  }
}