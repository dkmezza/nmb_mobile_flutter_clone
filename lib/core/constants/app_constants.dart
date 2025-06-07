// lib/core/constants/app_constants.dart

import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'NMB Mobile';
  
  // Asset paths
  static const String splashImagePath = 'assets/onboarding/splash.png';
  static const String onboarding1ImagePath = 'assets/onboarding/onboarding1.png';
  static const String onboarding2ImagePath = 'assets/onboarding/onboarding2.png';
  static const String onboarding3ImagePath = 'assets/onboarding/onboarding3.png';
  static const String onboarding4ImagePath = 'assets/onboarding/onboarding4.png';
  static const String onboarding5ImagePath = 'assets/onboarding/onboarding5.png';
  
  // Onboarding settings
  static const int totalOnboardingSlides = 5;
  static const Duration autoAdvanceInterval = Duration(seconds: 5);
  static const Duration slideTransitionDuration = Duration(milliseconds: 300);
  static const Duration splashDuration = Duration(seconds: 3);
  
  // PIN settings
  static const int maxPinLength = 4;
  
  // Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 300);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);
}

class AppColors {
  // Primary colors
  static const Color primaryBlue = Color(0xFF1E5AA8);
  static const Color primaryOrange = Color(0xFFFF6B35);
  
  // Background colors
  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color splashBackgroundColor = Color(0xFFF0F0F0);
  static const Color whiteBackground = Color(0xFFFFFFFF);
  
  // Text colors
  static const Color primaryTextColor = Color(0xFF2C2C2C);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color greetingTextColor = Color(0xFF2C2C2C);
  static const Color instructionTextColor = Color(0xFF757575);
  
  // Button colors
  static const Color pinButtonColor = Color(0xFF1E5AA8);
  static const Color pinButtonTextColor = Color(0xFFFFFFFF);
  static const Color deleteButtonColor = Color(0xFFFF6B35);
  
  // Indicator colors
  static const Color activeIndicatorColor = Color(0xFFFF6B35);
  static const Color inactiveIndicatorColor = Color(0xFFE0E0E0);
  
  // Overlay colors
  static const Color overlayBackgroundColor = Color(0xFFFFFFFF);
  static const Color shadowColor = Color(0x14000000);
  
  // Quick Services
  static const Color quickServicesTextColor = Color(0xFF1E5AA8);
  
  // PIN input
  static const Color pinInputBackground = Color(0xFFF5F5F5);
  static const Color pinInputBorder = Color(0xFFE0E0E0);
  
  // Success/Error colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFF44336);
  static const Color warningColor = Color(0xFFFF9800);
}

class AppTextStyles {
  // Greeting text
  static const TextStyle greetingText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.greetingTextColor,
    letterSpacing: 0.5,
  );
  
  // Instruction text
  static const TextStyle instructionText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.instructionTextColor,
    letterSpacing: 0.3,
  );
  
  // PIN button text
  static const TextStyle pinButtonText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.pinButtonTextColor,
  );
  
  // Quick Services text
  static const TextStyle quickServicesText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.quickServicesTextColor,
    decoration: TextDecoration.underline,
  );
  
  // App bar text
  static const TextStyle appBarText = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteBackground,
  );
  
  // Body text
  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryTextColor,
    letterSpacing: 0.25,
  );
  
  // Small text
  static const TextStyle smallText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryTextColor,
    letterSpacing: 0.4,
  );
}

class AppDimensions {
  // Padding and margins
  static const double extraSmallPadding = 4.0;
  static const double smallPadding = 8.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;
  
  // Border radius
  static const double smallBorderRadius = 8.0;
  static const double mediumBorderRadius = 12.0;
  static const double largeBorderRadius = 16.0;
  static const double extraLargeBorderRadius = 24.0;
  
  // Button dimensions
  static const double pinButtonSize = 60.0;
  static const double pinButtonSpacing = 16.0;
  
  // Indicator dimensions
  static const double indicatorSize = 8.0;
  static const double indicatorSpacing = 12.0;
  
  // Overlay dimensions
  static const double overlayMinHeight = 0.4; // 40% of screen height
  static const double overlayMaxHeight = 0.6; // 60% of screen height
  
  // Shadow elevation
  static const double cardElevation = 8.0;
  static const double buttonElevation = 2.0;
  
  // Icon sizes
  static const double smallIconSize = 16.0;
  static const double mediumIconSize = 24.0;
  static const double largeIconSize = 32.0;
  
  // Touch targets
  static const double minTouchTarget = 44.0;
}

class AppStrings {
  // Splash screen
  static const String splashTitle = 'NMB Mobile';
  
  // Onboarding
  static const String greetingText = 'Hi, David';
  static const String pinInstructionText = 'Kindly enter your Mkononi PIN';
  static const String quickServicesText = 'Quick Services';
  
  // Error messages
  static const String networkErrorMessage = 'Please check your internet connection';
  static const String generalErrorMessage = 'Something went wrong. Please try again.';
  static const String loadingMessage = 'Loading...';
  
  // Accessibility labels
  static const String pinButtonAccessibilityLabel = 'PIN button';
  static const String deleteButtonAccessibilityLabel = 'Delete PIN digit';
  static const String quickServicesAccessibilityLabel = 'Access Quick Services';
  static const String slideIndicatorAccessibilityLabel = 'Slide indicator';
  static const String onboardingSlideAccessibilityLabel = 'Onboarding slide';
}

class AppCurves {
  static const Curve defaultCurve = Curves.easeInOutCubic;
  static const Curve fastOutSlowIn = Curves.fastOutSlowIn;
  static const Curve bounceIn = Curves.bounceIn;
  static const Curve bounceOut = Curves.bounceOut;
  static const Curve elasticIn = Curves.elasticIn;
  static const Curve elasticOut = Curves.elasticOut;
}