import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import '../models/assessment_models.dart';
import '../models/project_models.dart';
import '../models/wifi_models.dart';

class AppTheme {
  static const Color primaryDark = Color(0xFF0D1117);
  static const Color primarySurface = Color(0xFF161B22);
  static const Color primarySurfaceVariant = Color(0xFF21262D);
  static const Color primaryBorder = Color(0xFF30363D);
  static const Color primaryText = Color(0xFFF0F6FC);
  static const Color secondaryText = Color(0xFF8B949E);
  static const Color accentBlue = Color(0xFF58A6FF);
  static const Color accentGreen = Color(0xFF3FB950);
  static const Color accentYellow = Color(0xFFD29922);
  static const Color accentRed = Color(0xFFF85149);
  static const Color accentPurple = Color(0xFFA371F7);

  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: accentBlue,
      secondary: accentPurple,
      tertiary: accentGreen,
      surface: primarySurface,
      surfaceVariant: primarySurfaceVariant,
      outline: primaryBorder,
      error: accentRed,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: primaryText,
      onSurfaceVariant: secondaryText,
      onError: Colors.white,
    ),
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: primarySurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: primaryText),
    ),
    cardTheme: CardThemeData(
      color: primarySurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: primaryBorder, width: 1),
      ),
      margin: const EdgeInsets.all(8),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentBlue,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: accentBlue,
        side: const BorderSide(color: accentBlue),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: accentBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: primarySurfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: accentBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: accentRed),
      ),
      labelStyle: const TextStyle(color: secondaryText),
      hintStyle: const TextStyle(color: secondaryText),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: primarySurface,
      surfaceTintColor: Colors.transparent,
      indicatorColor: primarySurfaceVariant,
      labelTextStyle: WidgetStateProperty.all(const TextStyle(fontSize: 12)),
      iconTheme: WidgetStateProperty.all(const IconThemeData(size: 24)),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: primarySurface,
      indicatorColor: primarySurfaceVariant,
      selectedIconTheme: const IconThemeData(color: accentBlue, size: 24),
      unselectedIconTheme: const IconThemeData(color: secondaryText, size: 24),
      selectedLabelTextStyle: const TextStyle(
        color: accentBlue,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelTextStyle: const TextStyle(color: secondaryText),
    ),
    dividerTheme: const DividerThemeData(
      color: primaryBorder,
      thickness: 1,
      space: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: primarySurfaceVariant,
      selectedColor: accentBlue.withValues(alpha: 0.2),
      labelStyle: const TextStyle(color: primaryText),
      secondaryLabelStyle: const TextStyle(color: Colors.black),
      side: const BorderSide(color: primaryBorder),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: primarySurfaceVariant,
        border: Border.all(color: primaryBorder),
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: const TextStyle(color: primaryText),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: primarySurfaceVariant,
      contentTextStyle: const TextStyle(color: primaryText),
      actionTextColor: accentBlue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: primarySurface,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: primaryBorder),
      ),
      titleTextStyle: const TextStyle(
        color: primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: const TextStyle(color: secondaryText),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: primarySurface,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: accentBlue,
      linearTrackColor: primaryBorder,
      circularTrackColor: primaryBorder,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: accentBlue,
      inactiveTrackColor: primaryBorder,
      thumbColor: accentBlue,
      overlayColor: accentBlue.withValues(alpha: 0.2),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: accentBlue,
      unselectedLabelColor: secondaryText,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: accentBlue, width: 3),
        insets: EdgeInsets.symmetric(horizontal: 16),
      ),
      labelStyle: const TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: secondaryText,
      textColor: primaryText,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    dataTableTheme: DataTableThemeData(
      headingRowColor: WidgetStateProperty.all(primarySurfaceVariant),
      dataRowColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected))
          return accentBlue.withValues(alpha: 0.1);
        if (states.contains(WidgetState.hovered)) return primarySurfaceVariant;
        return Colors.transparent;
      }),
      headingTextStyle: const TextStyle(
        color: primaryText,
        fontWeight: FontWeight.w600,
      ),
      dataTextStyle: const TextStyle(color: primaryText),
      dividerThickness: 1,
      columnSpacing: 24,
      horizontalMargin: 16,
    ),
  );

  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: accentBlue,
      brightness: Brightness.light,
    ),
  );

  // Severity colors
  static Color severityColor(Severity severity) {
    switch (severity) {
      case Severity.critical:
        return accentRed;
      case Severity.high:
        return accentRed;
      case Severity.medium:
        return accentYellow;
      case Severity.low:
        return accentGreen;
      case Severity.info:
        return accentBlue;
    }
  }

  static Color scanStatusColor(ScanStatus status) {
    switch (status) {
      case ScanStatus.running:
        return accentGreen;
      case ScanStatus.paused:
        return accentYellow;
      case ScanStatus.completed:
        return accentBlue;
      case ScanStatus.failed:
        return accentRed;
      case ScanStatus.cancelled:
        return secondaryText;
      case ScanStatus.pending:
        return secondaryText;
    }
  }

  static Color assessmentStatusColor(AssessmentStatus status) {
    switch (status) {
      case AssessmentStatus.running:
        return accentGreen;
      case AssessmentStatus.paused:
        return accentYellow;
      case AssessmentStatus.completed:
        return accentBlue;
      case AssessmentStatus.failed:
        return accentRed;
      case AssessmentStatus.cancelled:
        return secondaryText;
      case AssessmentStatus.draft:
        return secondaryText;
      case AssessmentStatus.queued:
        return accentPurple;
      case AssessmentStatus.initializing:
        return accentPurple;
      case AssessmentStatus.archived:
        return secondaryText;
    }
  }

  static Color projectStatusColor(ProjectStatus status) {
    switch (status) {
      case ProjectStatus.active:
        return accentGreen;
      case ProjectStatus.onHold:
        return accentYellow;
      case ProjectStatus.completed:
        return accentBlue;
      case ProjectStatus.archived:
        return secondaryText;
      case ProjectStatus.draft:
        return secondaryText;
      case ProjectStatus.planning:
        return accentPurple;
    }
  }

  static IconData severityIcon(Severity severity) {
    switch (severity) {
      case Severity.critical:
        return Symbols.error;
      case Severity.high:
        return Symbols.warning;
      case Severity.medium:
        return Symbols.report_problem;
      case Severity.low:
        return Symbols.info;
      case Severity.info:
        return Symbols.help_outline;
    }
  }

  static IconData scanModeIcon(ScanMode mode) {
    switch (mode) {
      case ScanMode.passive:
        return Symbols.visibility;
      case ScanMode.active:
        return Symbols.radar;
      case ScanMode.targeted:
        return Symbols.gps_fixed;
    }
  }
}
