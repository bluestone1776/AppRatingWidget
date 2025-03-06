# AppRatingWidget
flutter class that handles prompting users for an in-app review. 
 Here's what it does:

Shared Preferences Check:
It uses the shared_preferences package to check if the user has already been prompted for a rating. This prevents repeatedly asking for reviews.

In-App Review:
If the user has not been prompted yet, the code uses the in_app_review package to verify whether the review prompt is available. If it is, it requests an in-app review.

Flag Update:
After attempting to show the review prompt, it sets a flag in shared preferences so that the prompt is not shown again in the future.
