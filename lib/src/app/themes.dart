import 'package:flutter/material.dart';

@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color background;
  final Color startButtonActive;
  final Color startButtonInactive;
  final Color sliderActive;
  final Color sliderInactive;
  final Color sliderThumb;
  final Color navbar;

  const AppThemeColors({
    required this.background,
    required this.startButtonActive,
    required this.startButtonInactive,
    required this.sliderActive,
    required this.sliderInactive,
    required this.sliderThumb,
    required this.navbar,
  });

  @override
  AppThemeColors copyWith({
    Color? background,
    Color? startButtonActive,
    Color? startButtonInactive,
    Color? sliderActive,
    Color? sliderInactive,
    Color? sliderThumb,
    Color? navbar,
  }) {
    return AppThemeColors(
      background: background ?? this.background,
      startButtonActive: startButtonActive ?? this.startButtonActive,
      startButtonInactive: startButtonInactive ?? this.startButtonInactive,
      sliderActive: sliderActive ?? this.sliderActive,
      sliderInactive: sliderInactive ?? this.sliderInactive,
      sliderThumb: sliderThumb ?? this.sliderThumb,
      navbar: navbar ?? this.navbar,
    );
  }

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) return this;
    return AppThemeColors(
      background: Color.lerp(background, other.background, t)!,
      startButtonActive:
          Color.lerp(startButtonActive, other.startButtonActive, t)!,
      startButtonInactive:
          Color.lerp(startButtonInactive, other.startButtonInactive, t)!,
      sliderActive: Color.lerp(sliderActive, other.sliderActive, t)!,
      sliderInactive: Color.lerp(sliderInactive, other.sliderInactive, t)!,
      sliderThumb: Color.lerp(sliderThumb, other.sliderThumb, t)!,
      navbar: Color.lerp(navbar, other.navbar, t)!,
    );
  }

  static const light = AppThemeColors(
    background: Color(0xff4D9EB2),
    startButtonActive: Color(0xff1C678B),
    startButtonInactive: Color(0xff546E7A),
    sliderActive: Color(0xFFB5F1FC),
    sliderInactive: Color(0xFF1C678B),
    sliderThumb: Color(0xFFD2F6FF),
    navbar: Color(0xff1C678B),
  );

  static const dark = AppThemeColors(
    background: Color(0xff0D1B2A),
    startButtonActive: Color(0xff1874CD),
    startButtonInactive: Color(0xff2A3F54),
    sliderActive: Color(0xFFB5F1FC),
    sliderInactive: Color(0xFF1C678B),
    sliderThumb: Color(0xFFD2F6FF),
    navbar: Color(0xff1C678B),
  );
}
