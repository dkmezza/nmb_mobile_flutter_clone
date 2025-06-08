import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nmb_mobile_clone/core/constants/app_constants.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:nmb_mobile_clone/features/onboarding/bloc/onboarding_event.dart';
import 'package:nmb_mobile_clone/features/onboarding/data/models/pin_state.dart';

class PinInputOverlay extends StatelessWidget {
  final PinState pinState;
  final VoidCallback onQuickServicesPressed;

  const PinInputOverlay({
    super.key,
    required this.pinState,
    required this.onQuickServicesPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final overlayHeight = screenHeight * 0.45;

    return Container(
      height: overlayHeight,
      width: screenWidth,
      decoration: BoxDecoration(
        color: AppColors.overlayBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.extraLargeBorderRadius),
          topRight: Radius.circular(AppDimensions.extraLargeBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: AppDimensions.cardElevation,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.largePadding,
              vertical: AppDimensions.mediumPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildHeader(),
                _buildPinInput(),
                const SizedBox(height: AppDimensions.mediumPadding),
                _buildKeypad(),
                const SizedBox(height: AppDimensions.mediumPadding),
                _buildQuickServices(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        const Text(AppStrings.greetingText, style: AppTextStyles.greetingText),
        const SizedBox(height: AppDimensions.smallPadding),
        const Text(
          AppStrings.pinInstructionText,
          style: AppTextStyles.instructionText,
        ),
      ],
    );
  }

  Widget _buildPinInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        AppConstants.maxPinLength,
        (index) => _buildPinDot(index),
      ),
    );
  }

  Widget _buildPinDot(int index) {
    final isEntered = index < pinState.length;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.smallPadding,
      ),
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: isEntered ? AppColors.primaryOrange : AppColors.pinInputBorder,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        _buildKeypadRow(['1', '2', '3']),
        const SizedBox(height: AppDimensions.pinButtonSpacing),
        _buildKeypadRow(['4', '5', '6']),
        const SizedBox(height: AppDimensions.pinButtonSpacing),
        _buildKeypadRow(['7', '8', '9']),
        const SizedBox(height: AppDimensions.pinButtonSpacing),
        _buildLastRow(),
      ],
    );
  }

  Widget _buildKeypadRow(List<String> digits) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: digits.map((digit) => _buildKeypadButton(digit)).toList(),
    );
  }

  Widget _buildLastRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Empty space
        SizedBox(width: AppDimensions.pinButtonSize),
        // Zero button
        _buildKeypadButton('0'),
        // Delete button
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildKeypadButton(String digit) {
    return Builder(
      builder:
          (context) => GestureDetector(
            onTap: () {
              context.read<OnboardingBloc>().add(
                OnboardingPinDigitAdded(digit: digit),
              );
            },
            child: Container(
              width: AppDimensions.pinButtonSize,
              height: AppDimensions.pinButtonSize,
              decoration: const BoxDecoration(
                color: AppColors.pinButtonColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(digit, style: AppTextStyles.pinButtonText),
              ),
            ),
          ),
    );
  }

  Widget _buildDeleteButton() {
    return Builder(
      builder:
          (context) => GestureDetector(
            onTap: () {
              context.read<OnboardingBloc>().add(
                const OnboardingPinDigitRemoved(),
              );
            },
            child: Container(
              width: AppDimensions.pinButtonSize,
              height: AppDimensions.pinButtonSize,
              decoration: const BoxDecoration(
                color: AppColors.deleteButtonColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.whiteBackground,
                size: AppDimensions.mediumIconSize,
              ),
            ),
          ),
    );
  }

  Widget _buildQuickServices() {
    return GestureDetector(
      onTap: onQuickServicesPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.flash_on,
            size: AppDimensions.smallIconSize,
            color: AppColors.quickServicesTextColor,
          ),
          const SizedBox(width: AppDimensions.extraSmallPadding),
          const Text(
            AppStrings.quickServicesText,
            style: AppTextStyles.quickServicesText,
          ),
        ],
      ),
    );
  }
}
