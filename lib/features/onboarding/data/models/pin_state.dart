import 'package:equatable/equatable.dart';
import '../../../../core/constants/app_constants.dart';


class PinState extends Equatable {
  final String enteredPin;
  final bool isLoading;
  final String? errorMessage;
  final bool isComplete;

  const PinState({
    this.enteredPin = '',
    this.isLoading = false,
    this.errorMessage,
    this.isComplete = false,
  });

  bool get isEmpty => enteredPin.isEmpty;
  bool get isFull => enteredPin.length >= AppConstants.maxPinLength;
  int get length => enteredPin.length;

  PinState copyWith({
    String? enteredPin,
    bool? isLoading,
    String? errorMessage,
    bool? isComplete,
  }) {
    return PinState(
      enteredPin: enteredPin ?? this.enteredPin,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  PinState clearError() {
    return copyWith(errorMessage: null);
  }

  PinState addDigit(String digit) {
    if (isFull) return this;
    return copyWith(
      enteredPin: enteredPin + digit,
      errorMessage: null,
    );
  }

  PinState removeDigit() {
    if (isEmpty) return this;
    return copyWith(
      enteredPin: enteredPin.substring(0, enteredPin.length - 1),
      errorMessage: null,
    );
  }

  PinState clear() {
    return copyWith(
      enteredPin: '',
      errorMessage: null,
      isComplete: false,
    );
  }

  @override
  List<Object?> get props => [enteredPin, isLoading, errorMessage, isComplete];
}

