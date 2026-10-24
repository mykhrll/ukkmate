import 'package:intl/intl.dart';

/// Utility class for formatted dates and times in Indonesian / WIB locale.
class DateFormatter {
  /// Returns the current year as a string (e.g. '2026').
  static String get currentYear => DateTime.now().year.toString();

  /// Returns current academic year (e.g. '2026/2027').
  /// In Indonesian schools, academic year changes in July.
  static String get currentAcademicYear {
    final now = DateTime.now();
    if (now.month >= 7) {
      return '${now.year}/${now.year + 1}';
    } else {
      return '${now.year - 1}/${now.year}';
    }
  }

  /// Returns current full date in Indonesian format with WIB timezone indicator:
  /// e.g. "Sabtu, 24 Oktober 2026 • WIB"
  static String getCurrentFullDateWithWib() {
    final now = DateTime.now();
    const days = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    final dayName = days[now.weekday - 1];
    final monthName = months[now.month - 1];

    return '$dayName, ${now.day} $monthName ${now.year} • WIB';
  }

  /// Returns short date e.g. "24 Okt 2026"
  static String formatShortDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Okt',
      'Nov',
      'Des'
    ];
    return '${date.day.toString().padLeft(2, '0')} ${months[date.month - 1]} ${date.year}';
  }

  /// Returns current time formatted e.g. "18:30 WIB"
  static String getCurrentTimeWib() {
    final now = DateTime.now();
    final timeStr = DateFormat('HH:mm').format(now);
    return '$timeStr WIB';
  }
}
