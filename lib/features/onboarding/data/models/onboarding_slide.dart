import 'package:equatable/equatable.dart';

class OnboardingSlide extends Equatable {
  final String id;
  final String backgroundImagePath;
  final String? altText;
  final int order;
  final bool isActive;

  const OnboardingSlide({
    required this.id,
    required this.backgroundImagePath,
    this.altText,
    required this.order,
    this.isActive = true,
  });

  factory OnboardingSlide.fromJson(Map<String, dynamic> json) {
    return OnboardingSlide(
      id: json['id'] as String,
      backgroundImagePath: json['backgroundImagePath'] as String,
      altText: json['altText'] as String?,
      order: json['order'] as int,
      isActive: json['isActive'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backgroundImagePath': backgroundImagePath,
      'altText': altText,
      'order': order,
      'isActive': isActive,
    };
  }

  OnboardingSlide copyWith({
    String? id,
    String? backgroundImagePath,
    String? altText,
    int? order,
    bool? isActive,
  }) {
    return OnboardingSlide(
      id: id ?? this.id,
      backgroundImagePath: backgroundImagePath ?? this.backgroundImagePath,
      altText: altText ?? this.altText,
      order: order ?? this.order,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  List<Object?> get props => [id, backgroundImagePath, altText, order, isActive];
}
