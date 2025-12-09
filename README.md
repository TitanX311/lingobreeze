# LingoBreeze

LingoBreeze is a language learning application built with Flutter, designed to make learning a new language an adventurous journey.

## How to Run the Project

1.  **Prerequisites:** Ensure you have the Flutter SDK installed on your machine. You can verify this by running `flutter doctor`.
    *   **Dart SDK:** `^3.9.2`
    *   **Flutter SDK:** Compatible version
2.  **Install dependencies:**
    Open a terminal in the project root and run:
    ```bash
    flutter pub get
    ```
3.  **Run the app:**
    Connect a physical device or start an emulator/simulator, then run:
    ```bash
    flutter run
    ```

## Animations Implemented

This project includes custom animations to enhance the user interface, specifically in page navigation:

*   **Custom Page Route (`AnimatedRoute`):**
    *   **Location:** `lib/animations/animated_route.dart`
    *   **Behavior:** A composite transition effect used when navigating between onboarding screens.
        *   **Fade In:** The new page fades in using a `CurvedAnimation` (Curves.easeInOut).
        *   **Slide Out:** The current page slides out to the left using a `SlideTransition` with a custom `Tween<Offset>`.
    *   **Usage:** Used for smooth transitions, such as moving from the Welcome screen to the Focus screen.

## Additional Notes & Improvements

*   **Project Structure:**
    *   `lib/pages/`: Contains the individual screens for the onboarding flow (`OnboardingWelcome`, `OnboardingFocus`, etc.) and language selection.
    *   `lib/widgets/`: Reusable UI components (e.g., `OnboardingPageTemplate`).
    *   `lib/animations/`: Contains the custom animation logic.

*   **Theming:**
    *   The app uses a consistent dark theme with the background color `#06213D` and Material 3 design support.

*   **Assets:**
    *   Images are managed in the `assets/` directory and registered in `pubspec.yaml`.
