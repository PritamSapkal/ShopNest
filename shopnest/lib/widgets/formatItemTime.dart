import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatItemTime(TimeOfDay timeOfDay) {
  final now = DateTime.now();

  // 1. Convert TimeOfDay to a full DateTime object using current year/month/day
  final itemDateTime = DateTime(
    now.year,
    now.month,
    now.day,
    timeOfDay.hour,
    timeOfDay.minute,
  );

  // 2. Set up dates for matching boundaries
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(const Duration(days: 1));
  final itemDateOnly = DateTime(itemDateTime.year, itemDateTime.month, itemDateTime.day);

  // 3. Format the time part cleanly (e.g., "9:41 AM")
  final String formattedTime = DateFormat('h:mm a').format(itemDateTime);

  // 4. Compare dates to determine the contextual prefix string
  if (itemDateOnly == today) {
    return 'Today, $formattedTime';
  } else if (itemDateOnly == yesterday) {
    return 'Yesterday, $formattedTime';
  } else {
    // Fallback for older items: displays date instead (e.g., "15 Jul, 9:41 AM")
    final String formattedDate = DateFormat('d MMM').format(itemDateTime);
    return '$formattedDate, $formattedTime';
  }
}