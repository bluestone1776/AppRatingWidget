import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppRatingPrompt {
  static const _promptedKey = 'hasBeenPromptedForRating';

  /// Checks if the user has already been prompted for a review.
  /// If not, and if the in-app review feature is available,
  /// it shows the review prompt and marks the user as prompted.
  static Future<void> showPromptIfNeeded() async {
    final prefs = await SharedPreferences.getInstance();
    final hasBeenPrompted = prefs.getBool(_promptedKey) ?? false;

    if (!hasBeenPrompted) {
      final inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        await inAppReview.requestReview();
      }
      await prefs.setBool(_promptedKey, true);
    }
  }
}
