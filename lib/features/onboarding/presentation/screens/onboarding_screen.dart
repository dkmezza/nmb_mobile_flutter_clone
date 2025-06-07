import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_event.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_state.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:nmb_mobile_clone/features/onboarding/presentation/widgets/onboarding_carousel.dart';
import 'package:nmb_mobile_clone/features/onboarding/presentation/widgets/page_indicators.dart';
import 'package:nmb_mobile_clone/features/onboarding/presentation/widgets/pin_input_overlay.dart';
import 'package:nmb_mobile_clone/features/onboarding/presentation/widgets/quick_services_screen.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(
        repository: OnboardingRepository(),
      )..add(const OnboardingStarted()),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    
    // Set status bar style
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    context.read<OnboardingBloc>().add(
      OnboardingSlideChanged(
        slideIndex: index,
        isUserInitiated: true,
      ),
    );
  }

  void _onQuickServicesPressed() {
    context.read<OnboardingBloc>().add(
      const OnboardingQuickServicesRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          // Handle navigation based on state changes
          if (state.status == OnboardingStatus.completed) {
            // TODO: Navigate to main app/dashboard
            print('Onboarding completed - navigate to dashboard');
          } else if (state.status == OnboardingStatus.quickServices) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuickServicesScreen(),
              ),
            );
          }

          // Sync page controller with bloc state
          if (_pageController.hasClients && 
              state.currentSlideIndex != _pageController.page?.round()) {
            _pageController.animateToPage(
              state.currentSlideIndex,
              duration: AppConstants.slideTransitionDuration,
              curve: AppCurves.defaultCurve,
            );
          }
        },
        builder: (context, state) {
          if (state.status == OnboardingStatus.loading) {
            return const _LoadingWidget();
          }

          if (state.status == OnboardingStatus.error) {
            return _ErrorWidget(
              message: state.errorMessage ?? AppStrings.generalErrorMessage,
              onRetry: () {
                context.read<OnboardingBloc>().add(const OnboardingStarted());
              },
            );
          }

          if (state.slides.isEmpty) {
            return const _EmptyWidget();
          }

          return Stack(
            children: [
              // Background carousel
              OnboardingCarousel(
                pageController: _pageController,
                slides: state.slides,
                currentIndex: state.currentSlideIndex,
                onPageChanged: _onPageChanged,
              ),
              
              // PIN input overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: PinInputOverlay(
                  pinState: state.pinState,
                  onQuickServicesPressed: _onQuickServicesPressed,
                ),
              ),
              
              // Page indicators
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.42,
                child: PageIndicators(
                  totalSlides: state.totalSlides,
                  currentIndex: state.currentSlideIndex,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryOrange),
              strokeWidth: 3.0,
            ),
            SizedBox(height: AppDimensions.mediumPadding),
            Text(
              AppStrings.loadingMessage,
              style: AppTextStyles.bodyText,
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorWidget({
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      padding: const EdgeInsets.all(AppDimensions.largePadding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.errorColor,
            ),
            const SizedBox(height: AppDimensions.mediumPadding),
            Text(
              message,
              style: AppTextStyles.bodyText,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppDimensions.largePadding),
            ElevatedButton(
              onPressed: onRetry,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryOrange,
                foregroundColor: AppColors.whiteBackground,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.largePadding,
                  vertical: AppDimensions.mediumPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.mediumBorderRadius,
                  ),
                ),
              ),
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyWidget extends StatelessWidget {
  const _EmptyWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.info_outline,
              size: 64,
              color: AppColors.secondaryTextColor,
            ),
            SizedBox(height: AppDimensions.mediumPadding),
            Text(
              'No onboarding content available',
              style: AppTextStyles.bodyText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}